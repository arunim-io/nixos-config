{ config, pkgs, ... }: {
  home.stateVersion = "23.11";
  home.username = "arunim";
  home.homeDirectory = "/home/arunim";

  home.packages = with pkgs; [
    nil
    nixpkgs-fmt
  ];

  programs.home-manager.enable = true;
}
