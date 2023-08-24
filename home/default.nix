{ ... }: {
  imports = [
    ./theming.nix
    ./spotify.nix
    ./hyprland.nix
    ./neovim.nix
    ./coding.nix
  ];

  programs.home-manager.enable = true;

  home.stateVersion = "23.11";
}
