{ pkgs }: {
  space-cli = with pkgs; callPackage ./space-cli.nix { };
  ruff-lsp = with pkgs; callPackage ./ruff-lsp.nix { };
}
