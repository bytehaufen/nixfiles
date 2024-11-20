{
  pkgs,
  lib,
  config,
  ...
}: {
  options.opts.programs.teams.enable = lib.mkOption {
    default = false;
    type = lib.types.bool;
    description = ''
      Enables the Microsoft Teams Client for Linux
    '';
  };

  config = lib.mkIf config.opts.programs.teams.enable {home.packages = [pkgs.teams-for-linux];};
}
