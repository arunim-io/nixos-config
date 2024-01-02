_: {
  services.printing.enable = true;
  services.flatpak.enable = true;

  services.openssh = {
    enable = true;
    openFirewall = true;
  };

  services.gnome.gnome-keyring.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryFlavor = "gnome3";
  };
}
