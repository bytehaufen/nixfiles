{
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [./languages.nix];

  config = lib.mkIf config.opts.home.tui.enable {
    programs.helix = {
      enable = true;
      extraPackages = with pkgs; [
        markdown-oxide
        nodePackages.vscode-langservers-extracted
        shellcheck
      ];

      settings = {
        theme = "zed_onedark";
        editor = {
          bufferline = "multiple";
          color-modes = true;
          completion-trigger-len = 1;
          completion-replace = true;
          cursorline = true;
          cursor-shape = {
            insert = "bar";
            normal = "block";
            select = "underline";
          };
          indent-guides.render = true;
          inline-diagnostics = {
            cursor-line = "hint";
            other-lines = "error";
          };
          line-number = "relative";
          lsp.display-inlay-hints = true;
          statusline.center = ["position-percentage"];
          true-color = true;
          whitespace.characters = {
            newline = "↴";
            tab = "⇥";
          };
        };
        keys.normal.space.u = {
          f = ":format"; # format using LSP formatter
          w = ":set whitespace.render all";
          W = ":set whitespace.render none";
        };
      };
    };
  };
}
