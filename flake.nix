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

  outputs = { nixpkgs, home-manager, spicetify, neovim, hyprland-contrib, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      localPkgs = import ./pkgs pkgs;
      specialArgs = {
        inherit inputs localPkgs;
        hyprlandContribPkgs = hyprland-contrib.packages.${pkgs.system};
        nvimPkgs = neovim.packages.${system};
        spicetifyPkgs = spicetify.packages.${system}.default;
      };
    in
    {
      packages.${system} = localPkgs;
      nixosConfigurations.hp-elitebook = nixpkgs.lib.nixosSystem {
        inherit system specialArgs;
        modules = [
          ./nixos/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              extraSpecialArgs = specialArgs;
              useGlobalPkgs = true;
              useUserPackages = true;
              users.arunim.imports = [
                spicetify.homeManagerModule
                ./home-manager/home.nix
              ];
            };
          }
        ];
      };
    };
}

