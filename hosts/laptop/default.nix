{ ... }: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/system
    ../../modules/hyprland/os.nix
    ../../modules/podman/os.nix
    ../../modules/virt/os.nix
  ];

  networking.hostName = "hp-elitebook";
  system.stateVersion = "23.11";
}
