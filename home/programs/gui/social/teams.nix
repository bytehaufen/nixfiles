{
  pkgs,
  lib,
  config,
  ...
}: {
  options.programs.teams.enable = lib.mkOption {
    default = false;
    type = lib.types.bool;
    description = ''
      Enables the Microsoft Teams Client for Linux
    '';
  };

  config = lib.mkIf config.programs.teams.enable {home.packages = [pkgs.teams-for-linux];};
}
