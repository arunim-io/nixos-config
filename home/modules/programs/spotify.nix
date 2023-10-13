{ inputs, pkgs, ... }:
let
  spicetify = inputs.spicetify.packages.${pkgs.system}.default;
in
{
  programs.spicetify = with spicetify; {
    enable = true;
    spotifyPackage = pkgs.spotify;
    theme = themes.DefaultDynamic;
    enabledCustomApps = with apps; [ marketplace lyrics-plus ];
    enabledExtensions = with extensions; [ adblock volumePercentage fullScreen fullAlbumDate genre autoVolume ];
  };
}
