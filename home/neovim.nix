{ inputs, pkgs, ... }:
let
  neovim = inputs.neovim-nightly.packages.${pkgs.system}.neovim;
  packages = with pkgs; [
    # handled by pipx - djlint sourcery
    tree-sitter
    fd
    ripgrep
    gcc
    trashy
    nodePackages.vscode-langservers-extracted
    lua-language-server
    nodePackages.pyright
    ruff
    taplo
    nodePackages.svelte-language-server
    nodePackages.yaml-language-server
    dotenv-linter
    editorconfig-checker
    black
    prettierd
    nil
    nixpkgs-fmt
    statix
    nodePackages.dockerfile-language-server-nodejs
    nodePackages."@tailwindcss/language-server"
    nodePackages.bash-language-server
    shfmt
    shellcheck
  ];
in
{
  programs.neovim = {
    enable = true;
    package = neovim;
    extraPackages = packages;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = true;
    withPython3 = true;
    withRuby = false;
  };
}
