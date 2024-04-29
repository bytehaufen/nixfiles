{...}: {
  imports = [./cli/nnn];

  programs = {
    home-manager.enable = true;

    bat = {
      enable = true;
      config = {
        theme = "gruvbox-dark";
        tabs = "2";
      };
    };
    git.delta.enable = true;

    lazygit = {
      enable = true;
      settings = {
        git.paging = {
          colorArg = "always";
          pager = "delta --dark --paging=never -s";
        };
      };
    };

    git.enable = true;
  };
}
