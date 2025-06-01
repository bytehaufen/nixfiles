{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.opts.home.services.udiskie.enable {
    services.udiskie.enable = true;
  };
}
