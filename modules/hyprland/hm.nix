{ pkgs, ... }: {
  home = {
    packages = with pkgs; [
      pavucontrol
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
      (pkgs.writeShellScriptBin "polkit-gnome-agent" "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1")
    ];

    pointerCursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 32;
      gtk.enable = true;
      x11.enable = true;
    };

    file.hypr = {
      recursive = true;
      source = ./config;
      target = "./.config/hypr";
    };
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    pinentryFlavor = "gnome3";
  };
}
