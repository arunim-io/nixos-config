{ pkgs, ... }: {
  programs.spicetify = with pkgs.spicetify; {
    enable = true;
    enabledCustomApps = with apps; [ marketplace lyrics-plus ];
    enabledExtensions = with extensions; [ adblock volumePercentage fullAlbumDate genre ];
  };
}
