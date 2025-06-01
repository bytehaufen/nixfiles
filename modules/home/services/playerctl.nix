{
  pkgs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.opts.home.services.playerctl.enable {
    home.packages = [pkgs.playerctl];
    services.playerctld.enable = true;
  };
}
