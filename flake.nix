{
  description = "Arunim's Personal NixOS Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim = {
      url = "github:arunim-io/neovim-config/old-v2";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify.url = "github:the-argus/spicetify-nix";
  };

  outputs = { nixpkgs, home-manager, spicetify, ... }@inputs:
    let
      system = "x86_64-linux";
      packages = import ./pkgs nixpkgs.legacyPackages.${system};
    in
    {
      packages.${system} = packages;
      nixosConfigurations.hp-elitebook = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./nixos/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              extraSpecialArgs = {
                inherit inputs;
                localPkgs = packages;
              };
              useGlobalPkgs = true;
              useUserPackages = true;
              users.arunim.imports = [ spicetify.homeManagerModule ./home ];
            };
          }
        ];
      };
    };
}

