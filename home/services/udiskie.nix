{
  lib,
  config,
  ...
}: {
  options.opts.services.udiskie.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable udiskie";
  };
  config = lib.mkIf config.opts.services.udiskie.enable {
    services.udiskie.enable = true;
  };
}
