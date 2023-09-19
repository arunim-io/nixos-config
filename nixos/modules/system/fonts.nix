{ pkgs, ... }: {
  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;
    packages = with pkgs; [ ubuntu_font_family ];
    fontconfig = {
      subpixel.rgba = "rgb";
      defaultFonts = {
        monospace = [ "Ubuntu Mono" ];
        serif = [ "Ubuntu" ];
        sansSerif = [ "Ubuntu" ];
      };
    };
  };
}
