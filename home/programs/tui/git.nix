{
  # Enable scrolling in git diff
  home.sessionVariables.DELTA_PAGER = "less -R";

  programs = {
    git = {
      enable = true;

      delta = {
        enable = true;
        options = {
          dark = true;
          show-syntax-themes = true;
          minus-style = "syntax '#37222c'";
          minus-non-emph-style = "syntax '#37222c'";
          minus-emph-style = "syntax '#713137'";
          minus-empty-line-marker-style = "syntax '#37222c'";
          line-numbers-minus-style = "#914c54";
          plus-style = "syntax '#20303b'";
          plus-non-emph-style = "syntax '#20303b'";
          plus-emph-style = "syntax '#2c5a66'";
          plus-empty-line-marker-style = "syntax '#20303b'";
          line-numbers-plus-style = "#449dab";
          line-numbers-zero-style = "#3b4261";
        };
      };

      extraConfig = {
        diff.colorMoved = "default";
        merge.conflictstyle = "diff3";
      };

      ignores = ["*~" "*.swp" "*result*" ".direnv" "node_modules"];
    };

    # Github-cli
    gh = {
      enable = true;
      settings = {
        git_protocol = "ssh";
        prompt = "enabled";
        prefer_editor_prompt = "disabled";
        aliases = {
          co = "pr checkout";
        };
      };
    };

    lazygit = {
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
  };
}
