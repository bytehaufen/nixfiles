{
  lib,
  config,
  ...
}: {
  i18n = {
    defaultLocale = lib.mkDefault "en_US.UTF-8";
    extraLocaleSettings = {
      LC_TIME = lib.mkDefault "de_DE.UTF-8";
    };
    supportedLocales = lib.mkDefault [
      "en_US.UTF-8/UTF-8"
      "de_DE.UTF-8/UTF-8"
    ];
  };

  time.timeZone = lib.mkDefault "Europe/Berlin";

  location.provider = lib.mkIf config.opts.nixos.location.enable "geoclue2";

  # Enable geolocation services.
  services.geoclue2.enable = lib.mkIf config.opts.nixos.location.enable true;
}
