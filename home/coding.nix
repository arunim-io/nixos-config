{ pkgs, ... }: {
  home.packages = with pkgs; [
    nil
    nixpkgs-fmt
    gh
    python312
    poetry
    nodejs_20
    corepack_20
  ];

  programs = {
    git = {
      enable = true;
      delta.enable = true;
      userEmail = "mugdhaarunimahmed2017@gmail.com";
      userName = "Mugdha Arunim Ahmed";
    };
    lazygit.enable = true;

    vscode = {
      enable = true;
      package = pkgs.vscode-fhs;
    };
  };
}
