{ config, pkgs, ... }: {
  imports = [ ./boot.nix ./environment.nix ./font.nix ./locale.nix ./network.nix ./services.nix ./sound.nix ./user.nix ];

  # NixOS-related
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.trusted-users = [ "arunim" ];
}
