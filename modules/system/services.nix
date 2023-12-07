{ ... }: {
  services.printing.enable = true;
  services.flatpak.enable = true;

  services.openssh = {
    enable = true;
    openFirewall = true;
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryFlavor = "gnome3";
  };
}
