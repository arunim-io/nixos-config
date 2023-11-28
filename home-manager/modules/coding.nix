{ pkgs, localPkgs, ... }: {
  home.packages = with pkgs; [
    wezterm
    kitty
    tmux
    zellij
    rustup
    poetry
    nodejs
    nodePackages.pnpm
    lazygit
    gh
    distrobox
    localPkgs.space-cli
    localPkgs.djlint
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscode-fhs;
  };

  programs.direnv = {
    enable = true;
    enableFishIntegration = true;
    nix-direnv.enable = true;
    config.warn_timeout = "100h";
  };
}
