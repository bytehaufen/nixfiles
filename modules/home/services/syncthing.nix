{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.opts.home.services.syncthing.enable {
    services.syncthing.enable = true;
  };
}
