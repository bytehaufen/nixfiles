{
  lib,
  config,
  pkgs,
  ...
}: {
  config = lib.mkIf config.opts.home.gui.enable {
    home.packages = let
      discordPackages = lib.optionals config.opts.home.programs.discord.enable [pkgs.vesktop];
      teamsPackages = lib.optionals config.opts.home.programs.teams.enable [pkgs.teams-for-linux];
    in
      discordPackages ++ teamsPackages;
  };
}
