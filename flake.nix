{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    hypr-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify.url = "github:the-argus/spicetify-nix";
    wezterm = {
      url = "github:wez/wezterm?dir=nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvim.url = "github:arunim-io/nvim";
  };

  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
      "https://hyprland.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };

  outputs = inputs@{ self, ... }:
    let
      system = "x86_64-linux";
      pkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [
          self.overlays.default
          inputs.neovim-nightly-overlay.overlay
          inputs.hypr-contrib.overlays.default
        ];
      };
    in
    {
      overlays.default = final: prev: {
        inherit (inputs.spicetify.packages.${system}) spicetify;
        hyprland-dev = inputs.hyprland.packages.${system}.hyprland;
        wezterm = inputs.wezterm.packages.${system}.default;
      };
      nixosConfigurations."hp-elitebook" = inputs.nixpkgs.lib.nixosSystem {
        inherit system pkgs;
        modules = [
          ./hosts/laptop
          {
            nix = {
              gc = {
                automatic = true;
                dates = "weekly";
                options = "--delete-older-than 7d";
              };
              settings = {
                auto-optimise-store = true;
                trusted-users = [ "arunim" ];
                experimental-features = [ "nix-command" "flakes" ];
              };
            };
          }
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.arunim.imports = [
                inputs.spicetify.homeManagerModule
                inputs.nvim.homeManagerModules.default
                ./home
              ];
              extraSpecialArgs = { inherit pkgs; };
            };
          }
        ];
      };
      templates = {
        default = self.templates.basic;
        basic = {
          path = ./templates/basic;
          description = "A simple flake with flake-parts support";
        };
        rust = {
          path = ./templates/rust;
          description = "A simple rust project with flake-parts support";
        };
      };
    };
}
