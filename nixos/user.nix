{ pkgs, ... }: {
  environment = {
    shells = with pkgs; [ bash fish ];
    systemPackages = with pkgs; [ git wget python3 most gnumake gcc pulseaudio nettools inxi ];
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
      xfce.thunar
      xfce.thunar-archive-plugin
      uget
      stacer
      chezmoi
      starship
      fastfetch
      exa
      ripgrep
      bottom
      rm-improved
      zoxide
      bat
      topgrade
      aria2
    ];
    shell = pkgs.fish;
  };

  programs.fish = {
    enable = true;
    useBabelfish = true;
  };
}
