{ pkgs, ... }: {
  imports = [
    ./coding.nix
    ./spotify.nix
    ../modules/hyprland/hm.nix
  ];
  home = {
    stateVersion = "23.11";
    username = "arunim";
    homeDirectory = "/home/arunim";

    packages = with pkgs; [
      zoom-us
      discord
      topgrade
    ];
  };

  programs = {
    home-manager.enable = true;

    firefox = {
      enable = true;
      package = pkgs.firefox-bin;
    };

    ags.enable = true;
    gBar.enable = true;
  };
}
