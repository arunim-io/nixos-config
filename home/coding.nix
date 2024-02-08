{ pkgs, ... }: {
  imports = [ ../modules/direnv/home.nix ../modules/git/home.nix ];
  home.packages = with pkgs; [
    bun
    gcc
    gnumake
  ];

  programs = {
    vscode = {
      enable = true;
      package = pkgs.vscode.fhs;
    };

    nvim = {
      enable = true;
      package = pkgs.neovim-nightly;
    };
  };
}
