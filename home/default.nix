{ ... }: {
  imports = [ ./modules ];

  programs.home-manager.enable = true;

  home.stateVersion = "23.11";
}
