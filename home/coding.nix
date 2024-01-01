{ pkgs, ... }: {
  home.packages = with pkgs; [
    nil
    nixpkgs-fmt
    lua-language-server
    vscode-langservers-extracted
    nodePackages.bash-language-server
    dockerfile-language-server-nodejs
    nodePackages.pyright
    ruff
    ruff-lsp
    typescript
    nodePackages.svelte-language-server
    nodePackages.typescript-language-server
    nodePackages."@astrojs/language-server"
    nodePackages."@tailwindcss/language-server"
    tree-sitter
    nodePackages.prettier
    taplo
    shfmt
    black
    selene
    stylua
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

  home.sessionVariables = {
    PAGER = "nvim +Man!";
    MANPAGER = "nvim +Man!";
  };
}
