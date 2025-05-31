{
  lib,
  config,
  pkgs,
  ...
}: {
  options.opts.programs.discord.enable = lib.mkOption {
    default = false;
    type = lib.types.bool;
    description = ''
      Enable Discord Vesktop Client
    '';
  };

  options.opts.programs.teams.enable = lib.mkOption {
    default = false;
    type = lib.types.bool;
    description = ''
      Enable Microsoft Teams Client for Linux
    '';
  };

  config = lib.mkIf config.opts.gui.enable {
    home.packages = let
      discordPackages = lib.optionals config.opts.programs.discord.enable [pkgs.vesktop];
      teamsPackages = lib.optionals config.opts.programs.teams.enable [pkgs.teams-for-linux];
    in
      discordPackages ++ teamsPackages;
  };
}
