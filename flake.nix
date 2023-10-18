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
      url = "github:arunim-io/neovim-config";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify.url = "github:the-argus/spicetify-nix";
  };

  outputs = { nixpkgs, home-manager, spicetify, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
      localPkgs = import ./pkgs { inherit pkgs; };
    in
    {
      packages.${system} = localPkgs;
      nixosConfigurations.hp-elitebook = nixpkgs.lib.nixosSystem {
        inherit system pkgs;
        specialArgs = { inherit inputs; };
        modules = [
          ./nixos/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              extraSpecialArgs = { inherit inputs localPkgs; };
              useGlobalPkgs = true;
              useUserPackages = true;
              users.arunim.imports = [ spicetify.homeManagerModule ./home ];
            };
          }
        ];
      };
    };
}

