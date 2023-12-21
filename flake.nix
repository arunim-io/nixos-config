{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify.url = "github:the-argus/spicetify-nix";
    ags.url = "github:Aylur/ags";
    wezterm = {
      url = "github:happenslol/wezterm/add-nix-flake?dir=nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  nixConfig = {
    extra-substituters = [ "https://nix-community.cachix.org" ];
    extra-trusted-public-keys = [ "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=" ];
  };

  outputs = { nixpkgs, home-manager, spicetify, ags, wezterm, ... }:
    let
      getPackages = pkgs: with pkgs; {
        djlint = callPackage ./pkgs/djlint.nix { };
      };
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [
          (_: prev:
            let packages = getPackages prev;
            in {
              inherit (spicetify.packages.${system}) spicetify;
              inherit packages;
              wezterm = wezterm.packages.${system}.default;
            })
        ];
      };
    in
    {
      packages.${system} = getPackages pkgs;
      nixosConfigurations."hp-elitebook" = nixpkgs.lib.nixosSystem {
        inherit system pkgs;
        modules = [
          ./hosts/laptop
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.arunim.imports = [ spicetify.homeManagerModule ags.homeManagerModules.default ./home ];
            };
          }
        ];
      };
    };
}
