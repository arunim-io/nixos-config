{ inputs, pkgs, ... }: {
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

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    defaultNetwork.settings.dns_enabled = true;
  };
}
