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
    apm = {
      url = "github:arunim-io/apm";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  nixConfig = {
    extra-substituters = [ "https://nix-community.cachix.org" "https://arunim-nixos-config.cachix.org" ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "arunim-nixos-config.cachix.org-1:OTRenitAelvEbzzVI589dV5QtvZf7JcLJLbf1proiiw="
    ];
  };

  outputs = { nixpkgs, home-manager, spicetify, wezterm, fenix, neovim-nightly-overlay, apm, ... }:
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
              inherit (apm.packages.${system}) apm;
              inherit packages;
              wezterm = wezterm.packages.${system}.default;
            })
          fenix.overlays.default
          neovim-nightly-overlay.overlay
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
                ./home
              ];
              extraSpecialArgs = { inherit pkgs fenix; };
            };
          }
        ];
      };
      templates.rust = {
        path = ./templates/rust;
        description = "A simple rust project with flake-parts support";
      };
    };
}
