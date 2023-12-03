{ config, pkgs, ... }: {
  home.stateVersion = "23.11";
  home.username = "arunim";
  home.homeDirectory = "/home/arunim";

  home.packages = with pkgs; [
    firefox
    kate
    vscode-fhs
    git
    zoom-us
    nil
    nixpkgs-fmt
  ];

  programs.home-manager.enable = true;
}
