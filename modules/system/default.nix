{ ... }: {
  imports = [ ./boot.nix ./environment.nix ./font.nix ./locale.nix ./network.nix ./services.nix ./sound.nix ./user.nix ];

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    settings = {
      auto-optimise-store = true;
      trusted-users = [ "arunim" ];
      experimental-features = [ "nix-command" "flakes" ];
    };
  };
}
