{ pkgs, ... }: {
  imports = [ ./coding.nix ./spotify.nix ];

  home.stateVersion = "23.11";
  home.username = "arunim";
  home.homeDirectory = "/home/arunim";

  home.packages = with pkgs; [
    zoom-us
    discord
    topgrade
  ];

  programs.home-manager.enable = true;

  programs.firefox = {
    enable = true;
    package = pkgs.firefox-bin;
  };
}
