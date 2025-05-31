{
  pkgs,
  lib,
  config,
  ...
}: {
  options.opts.services.playerctl.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable playerctl";
  };
  config = lib.mkIf config.opts.services.playerctl.enable {
    home.packages = [pkgs.playerctl];
    services.playerctld.enable = true;
  };
}
