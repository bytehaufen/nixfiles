{pkgs, ...}: {
  home.packages = [pkgs.gh];

  # enable scrolling in git diff
  home.sessionVariables.DELTA_PAGER = "less -R";

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

  programs.lazygit = {
    enable = true;
    settings = {
      gui = {
        nerdFontsVersion = "3";
        theme = {
          activeBorderColor = [
            "#ff9e64"
            "bold"
          ];
          inactiveBorderColor = ["#27a1b9"];
          searchingActiveBorderColor = [
            "#ff9e64"
            "bold"
          ];
          optionsTextColor = ["#7aa2f7"];
          selectedLineBgColor = ["#283457"];
          cherryPickedCommitFgColor = ["#7aa2f7"];
          cherryPickedCommitBgColor = ["#bb9af7"];
          markedBaseCommitFgColor = ["#7aa2f7"];
          markedBaseCommitBgColor = ["#e0af68"];
          unstagedChangesColor = ["#db4b4b"];
          defaultFgColor = ["#c0caf5"];
        };
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
}
