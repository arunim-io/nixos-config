{ pkgs }: with pkgs; {
  space-cli = callPackage ./space-cli.nix { };
}
