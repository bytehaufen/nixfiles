{...}: {
  imports = [./cli/nnn];

  programs.home-manager.enable = true;

  programs.bat = {
    enable = true;
    config = {
      theme = "gruvbox-dark";
      tabs = "2";
    };
  };

  programs.git.enable = true;
  #TODO: fix!
}
