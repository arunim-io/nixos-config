{ pkgs, ... }: {
  home.stateVersion = "23.11";
  home.username = "arunim";
  home.homeDirectory = "/home/arunim";

  home.packages = with pkgs; [
    firefox
    kate
    vscode-fhs
    git
    zoom-us
    discord
    topgrade
    nil
    nixpkgs-fmt
    gh
  ];

  programs.home-manager.enable = true;
}
