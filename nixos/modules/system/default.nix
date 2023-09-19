{ ... }: {
  imports = [ ./bootloader.nix ./networking.nix ./sound.nix ./security.nix ./fonts.nix ];

  time.timeZone = "Asia/Dhaka";

  i18n = {
    defaultLocale = "en_GB.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_GB.UTF-8";
      LC_IDENTIFICATION = "en_GB.UTF-8";
      LC_MEASUREMENT = "en_GB.UTF-8";
      LC_MONETARY = "en_GB.UTF-8";
      LC_NAME = "en_GB.UTF-8";
      LC_NUMERIC = "en_GB.UTF-8";
      LC_PAPER = "en_GB.UTF-8";
      LC_TELEPHONE = "en_GB.UTF-8";
      LC_TIME = "en_GB.UTF-8";
    };
  };

  services.printing.enable = true;

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  services.flatpak.enable = true;
  xdg.portal.enable = true;
}

