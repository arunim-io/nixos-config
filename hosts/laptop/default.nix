{ ... }: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/system
    ../../modules/hyprland/os.nix
  ];

  networking.hostName = "hp-elitebook";

  services.xserver.enable = true;

  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "arunim";

  system.stateVersion = "23.11";
}
