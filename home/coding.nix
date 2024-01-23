{ pkgs, ... }: {
  imports = [ ../modules/direnv/home.nix ../modules/git/home.nix ];
  home.packages = with pkgs; [
    bun
    nix-init
    gcc
    gnumake
    (fenix.stable.withComponents [
      "cargo"
      "clippy"
      "rust-src"
      "rustc"
      "rustfmt"
    ])
    rust-analyzer-nightly
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

  home.sessionVariables = {
    PAGER = "nvim +Man!";
    MANPAGER = "nvim +Man!";
  };
}
