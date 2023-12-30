{ pkgs, ... }: {
  home.packages = with pkgs; [
    nil
    nixpkgs-fmt
    lua-language-server
    vscode-langservers-extracted
    tree-sitter
    fd
    ripgrep
    gh
    python312
    poetry
    djlint
    nodejs_20
    corepack_20
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
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    git = {
      enable = true;
      delta.enable = true;
      userEmail = "mugdhaarunimahmed2017@gmail.com";
      userName = "Mugdha Arunim Ahmed";
    };
    lazygit.enable = true;

    vscode = {
      enable = true;
      package = pkgs.vscode.fhs;
    };

    neovim = {
      enable = true;
      package = pkgs.neovim-nightly;
      viAlias = true;
      vimAlias = true;
    };
  };
}
