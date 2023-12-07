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

  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 32;
    gtk.enable = true;
    x11.enable = true;
  };

  services.gnome-keyring = {
    enable = true;
    components = [ "pkcs11" "secrets" "ssh" ];
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    pinentryFlavor = "gnome3";
  };
}
