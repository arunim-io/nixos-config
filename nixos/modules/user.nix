{ pkgs, ... }: {
  environment = with pkgs; {
    shells = [ bash fish ];
    systemPackages = [ git wget most gnumake gcc pulseaudio nettools inxi ];
  };

  users.users.arunim = with pkgs; {
    isNormalUser = true;
    description = "Mugdha Arunim Ahmed";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = [
      firefox-bin
      zoom-us
      discord
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
