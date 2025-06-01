{
  lib,
  config,
  ...
}: {
  options.opts.home.services.kdeconnect.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = ''
      Enable KDE Connect service.
    '';
  };

  config = lib.mkIf config.opts.home.services.kdeconnect.enable {
    services.kdeconnect = {
      enable = true;
      indicator = true;
    };
  };
}
