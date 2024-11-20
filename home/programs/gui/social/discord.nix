{
  pkgs,
  lib,
  config,
  ...
}: {
  options.opts.programs.discord.enable = lib.mkOption {
    default = false;
    type = lib.types.bool;
    description = ''
      Enable Discord Vesktop Client
    '';
  };

  config = lib.mkIf config.opts.programs.discord.enable {home.packages = [pkgs.vesktop];};
}
