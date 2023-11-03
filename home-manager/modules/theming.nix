{ pkgs, ... }: {
  home.packages = with pkgs; [
    gnome.gnome-themes-extra
    gnome.adwaita-icon-theme
    jetbrains-mono
    ubuntu_font_family
  ];
  fonts.fontconfig.enable = true;
  gtk = with pkgs; {
    enable = true;
    font = {
      name = "Ubuntu";
      package = ubuntu_font_family;
    };
    theme = {
      name = "adw-gtk3-dark";
      package = adw-gtk3;
    };
  };
  qt = {
    enable = true;
    style = {
      package = pkgs.adwaita-qt;
      name = "adwaita-dark";
    };
  };
}
