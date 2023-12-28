{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify.url = "github:the-argus/spicetify-nix";
    wezterm = {
      url = "github:happenslol/wezterm/add-nix-flake?dir=nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ags.url = "github:Aylur/ags";
    gBar.url = "github:scorpion-26/gBar";
  };

  nixConfig = {
    extra-substituters = [ "https://nix-community.cachix.org" ];
    extra-trusted-public-keys = [ "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=" ];
  };

  outputs = { nixpkgs, home-manager, spicetify, ags, wezterm, fenix, gBar, ... }:
    let
      getPackages = pkgs: with pkgs; {
        djlint = callPackage ./pkgs/djlint.nix { };
        wezterm = callPackage ./pkgs/wezterm { };
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
          fenix.overlays.default
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
              users.arunim.imports = [
                spicetify.homeManagerModule
                ags.homeManagerModules.default
                gBar.homeManagerModules.${system}.default
                ./home
              ];
              extraSpecialArgs = { inherit pkgs fenix; };
            };
          }
        ];
      };
    };
}
