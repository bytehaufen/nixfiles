{
  lib,
  config,
  ...
}: {
  options.opts.home.services.syncthing.enable = lib.mkOption {
    default = false;
    description = "Enable Syncthing service";
  };
  config = lib.mkIf config.opts.home.services.syncthing.enable {
    services.syncthing.enable = true;
  };
}
