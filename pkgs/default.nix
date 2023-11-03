pkgs: with pkgs; {
  space-cli = callPackage ./space-cli.nix { };
  ruff-lsp = callPackage ./ruff-lsp.nix { };
}
