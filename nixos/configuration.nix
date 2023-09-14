{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./system.nix
    ./user.nix
    ./software.nix
  ];

  nix = {
    package = pkgs.nixFlakes;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "23.11";
}
