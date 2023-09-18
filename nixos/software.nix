{ pkgs, ... }: {
  services = {
    xserver = {
      enable = true;
      layout = "us";
      xkbVariant = "";
    };
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --cmd Hyprland";
          user = "greeter";
        };
      };
    };
    flatpak.enable = true;
    gnome.gnome-keyring.enable = true;
  };

  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal";
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
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
