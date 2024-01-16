_: {
  programs = {
    git = {
      enable = true;
      delta.enable = true;
      userEmail = "mugdhaarunimahmed2017@gmail.com";
      userName = "Mugdha Arunim Ahmed";
    };
    lazygit.enable = true;
    gh = {
      enable = true;
      settings = {
        git_protocol = "https";
        editor = "nvim";
        pager = "nvim +Man!";
      };
    };
  };
}
