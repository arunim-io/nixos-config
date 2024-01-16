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
    extra-substituters = [
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  outputs = inputs:
    let
      system = "x86_64-linux";
      pkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [
          (_: prev: {
            inherit (inputs.spicetify.packages.${system}) spicetify;
            inherit (inputs.apm.packages.${system}) apm;
            wezterm = inputs.wezterm.packages.${system}.default;
            djlint = prev.callPackage ./pkgs/djlint.nix { };
          })
          inputs.fenix.overlays.default
          inputs.neovim-nightly-overlay.overlay
        ];
      };
    in
    {
      nixosConfigurations."hp-elitebook" = inputs.nixpkgs.lib.nixosSystem {
        inherit system pkgs;
        modules = [
          ./hosts/laptop
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.arunim.imports = [
                inputs.spicetify.homeManagerModule
                ./home
              ];
              extraSpecialArgs = { inherit pkgs; };
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
