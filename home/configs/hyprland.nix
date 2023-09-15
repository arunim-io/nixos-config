{ inputs, pkgs, ... }:
let
  grimblast = inputs.hyprland-contrib.packages.${pkgs.system}.grimblast;
in
{
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
    grimblast
    xfce.thunar
    xfce.thunar-archive-plugin
  ];

  programs.waybar.enable = true;

  services.copyq.enable = true;

}
