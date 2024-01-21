{ pkgs, ... }: {
  imports = [ ./coding.nix ./spotify.nix ../modules/hyprland/hm.nix ];

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
  };

  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.gnome.adwaita-icon-theme;
      name = "Adwaita-dark";
    };
    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
  };
}
