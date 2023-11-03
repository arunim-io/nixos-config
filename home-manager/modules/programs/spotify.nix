{ pkgs, spicetifyPkgs, ... }: {
  programs.spicetify = with spicetifyPkgs; {
    enable = true;
    spotifyPackage = pkgs.spotify;
    theme = themes.DefaultDynamic;
    enabledCustomApps = with apps; [ marketplace lyrics-plus ];
    enabledExtensions = with extensions; [ adblock volumePercentage fullScreen fullAlbumDate genre ];
  };
}
