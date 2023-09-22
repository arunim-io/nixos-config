{ inputs, pkgs, ... }:
let
  neovim = inputs.neovim.packages.${pkgs.system}.default;
  packages = import ./packages.nix { inherit pkgs; };
in
{
  home.packages = packages;
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
