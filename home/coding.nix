{ pkgs, ... }: {
  imports = [ ../modules/direnv/home.nix ../modules/git/home.nix ];
  home.packages = with pkgs; [
    nil
    nixpkgs-fmt
    statix
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
    python3
    # poetry - TODO: Switch to pdm
    # djlint
    nodejs_20
    corepack_20
    bun
    nix-init
    gcc
    gnumake
    shellcheck
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
