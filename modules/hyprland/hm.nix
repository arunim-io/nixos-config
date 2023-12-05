{ pkgs, ... }: {
  home.packages = with pkgs; [
    pipewire
    pulseaudio
    dunst
    networkmanagerapplet
    cliphist
    wl-clipboard
    wlogout
    playerctl
    waybar
    kitty
    wezterm
    wofi
  ];
}
