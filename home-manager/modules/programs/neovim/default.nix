{ pkgs, localPkgs, nvimPkgs, ... }:
let
  packages = import ./packages.nix { inherit pkgs localPkgs; };
in
{
  home.packages = packages;
  programs.neovim = {
    enable = true;
    package = nvimPkgs.default;
    extraPackages = packages;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = true;
    withPython3 = true;
    withRuby = false;
  };
}
