{
  lib,
  config,
  ...
}: {
  options.opts.services.kdeconnect.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = ''
      Enable KDE Connect service.
    '';
  };

  config = lib.mkIf config.opts.services.kdeconnect.enable {
    services.kdeconnect = {
      enable = true;
      indicator = true;
    };
  };
}
