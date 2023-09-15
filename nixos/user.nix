{ pkgs, ... }: {
  environment = with pkgs; {
    shells = [ bash fish ];
    systemPackages = [ git wget most gnumake gcc pulseaudio nettools inxi ];
  };

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

  users.users.arunim = with pkgs; {
    isNormalUser = true;
    description = "Mugdha Arunim Ahmed";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = [
      firefox-bin
      zoom-us
      uget
      stacer
      chezmoi
      starship
      bottom
      rm-improved
      zoxide
      bat
      topgrade
      aria2
    ];
    shell = fish;
  };

  programs.fish = {
    enable = true;
    useBabelfish = true;
  };
}
