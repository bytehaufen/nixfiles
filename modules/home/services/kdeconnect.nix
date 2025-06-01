{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.opts.home.services.kdeconnect.enable {
    services.kdeconnect = {
      enable = true;
      indicator = true;
    };
  };
}
