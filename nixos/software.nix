{ ... }: {
  services = {
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      layout = "us";
      xkbVariant = "";
    };
    flatpak.enable = true;
    gnome.gnome-keyring.enable = true;
  };

  security.pam.services.swaylock = { };

  programs.hyprland.enable = true;

  virtualisation.podman = {
    enable = true;
    autoPrune.enable = true;
    dockerSocket.enable = true;
    dockerCompat = true;
    defaultNetwork.settings.dns_enabled = true;
    networkSocket.openFirewall = true;
  };
}
