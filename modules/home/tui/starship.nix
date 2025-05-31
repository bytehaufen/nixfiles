{
  config,
  lib,
  ...
}: {
  home.sessionVariables.STARSHIP_CACHE = "${config.xdg.cacheHome}/starship";

  programs.starship = {
    enable = true;

    enableBashIntegration = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;

    settings = {
      character = {
        success_symbol = "[›](bold green)";
        error_symbol = "[›](bold red)";
      };

      git_status = {
        deleted = "✗";
        modified = "✶";
        staged = "✓";
        stashed = "≡";
      };

      nix_shell = {
        symbol = " ";
        heuristic = true;
      };
      custom.netns = {
        command = "ip netns identify";
        when = ''[ -n "$(ip netns identify)" ] '';
        format = "[󱂇 ](bold yellow)$output: ";
      };
      format = lib.concatStrings [
        "$custom"
        "$all"
      ];
    };
  };
}
