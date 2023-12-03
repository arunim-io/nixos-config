{ config, pkgs, ... }: {
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    nil
    nixpkgs-fmt
  ];
}