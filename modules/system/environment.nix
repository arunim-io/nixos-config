{ pkgs, ... }: {
  environment = with pkgs; {
    shells = [ bash fish nushell ];
    systemPackages = [
      git
      gnupg
      curl
      wget
      aria2
      killall
      bat
      zoxide
      htop
      bottom
      nettools
      inxi
    ];
  };
}
