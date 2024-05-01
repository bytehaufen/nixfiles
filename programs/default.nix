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

    btop = {
      enable = true;
      settings = {
        color_theme = "gruvbox_dark";
        theme_background = false;
      };
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
      # TODO:
      enableZshIntegration = true;
    };

    # TODO:
    # zsh.enable = true;

    git.enable = true;
  };
}