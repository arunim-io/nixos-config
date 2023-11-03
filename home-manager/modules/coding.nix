{ pkgs, localPkgs, ... }: {
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
    localPkgs.space-cli
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
