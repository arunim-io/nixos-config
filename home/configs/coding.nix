{ pkgs, ... }: {
  home.packages = with pkgs; [
    wezterm
    tmux
    zellij
    rustup
    poetry
    nodejs
    nodePackages.pnpm
    lazygit
    gh
    distrobox
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
