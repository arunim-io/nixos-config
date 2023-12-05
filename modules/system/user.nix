{ pkgs, ... }: {
  users.users.arunim = {
    isNormalUser = true;
    description = "Mugdha Arunim Ahmed";
    extraGroups = [ "networkmanager" "wheel" "input" ];
    shell = pkgs.fish;
  };

  programs.fish = {
    enable = true;
    useBabelfish = true;
  };
}
