{pkgs, ...}: {
  home.packages = [pkgs.gh];

  # enable scrolling in git diff
  home.sessionVariables.DELTA_PAGER = "less -R";

  programs.lazygit = {
    enable = true;
    settings = {
      gui = {
        nerdFontsVersion = "3";
      };
      git = {
        paging = {
          colorArg = "always";
          pager = "delta --dark --paging=never -s";
        };
        parseEmoji = true;
      };
    };
  };

  programs.git = {
    enable = true;

    delta = {
      enable = true;
      options.dark = true;
    };

    extraConfig = {
      diff.colorMoved = "default";
      merge.conflictstyle = "diff3";
    };

    ignores = ["*~" "*.swp" "*result*" ".direnv" "node_modules"];
  };
}
