{ pkgs, ... }: {
  environment = with pkgs; {
    shells = [ bash fish nushell ];
    systemPackages = [ ];
  };
}
