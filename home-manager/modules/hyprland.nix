{ pkgs, hyprlandContribPkgs, ... }: {
  home.packages = with pkgs; [
    xdg-desktop-portal-hyprland
    hyprpicker
    blueman
    swaynotificationcenter
    playerctl
    brightnessctl
    wpaperd
    wlogout
    pavucontrol
    wl-clipboard
    swaylock-effects
    font-awesome
    rofi-wayland
    networkmanagerapplet
    hyprlandContribPkgs.grimblast
    xfce.thunar
    xfce.thunar-archive-plugin
  ];

  programs.waybar.enable = true;

  services.copyq.enable = true;

}
