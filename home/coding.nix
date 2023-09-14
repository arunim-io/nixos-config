{ pkgs, ... }: {
  home.packages = with pkgs; [
    wezterm
    vscode-fhs
    tmux
    zellij
    rustup
    poetry
    pipx
    nodejs
    nodePackages.pnpm
    lazygit
    gh
    distrobox
  ];

  programs.direnv = {
    enable = true;
    enableFishIntegration = true;
    nix-direnv.enable = true;
    config.warn_timeout = "100h";
  };
}
