{
  lib,
  config,
  ...
}: {
  options.opts.services.syncthing.enable = lib.mkOption {
    default = false;
    description = "Enable Syncthing service";
  };
  config = lib.mkIf config.opts.services.syncthing.enable {
    services.syncthing.enable = true;
  };
}
