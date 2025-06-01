{
  lib,
  config,
  ...
}: {
  options.opts.home.services.udiskie.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable udiskie";
  };
  config = lib.mkIf config.opts.home.services.udiskie.enable {
    services.udiskie.enable = true;
  };
}
