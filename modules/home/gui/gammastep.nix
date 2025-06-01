{
  lib,
  config,
  ...
}: {
  # Adjust the color temperature(& brightness) of your screen
  config = lib.mkIf config.opts.home.gui.enable {
    services.gammastep = {
      enable = true;
      # add a gammastep icon in the system tray
      # has problem with wayland, so disable it
      tray = true;
      temperature = {
        day = 6000;
        night = 5000;
      };
      settings = {
        general = {
          fade = "1";
          brightness-day = "1.0";
          brightness-night = "0.8";
          location-provider = "manual";
        };
        manual = {
          # Germany, Dresden
          lat = "51.0504"; # Latitude
          lon = "13.7373"; # Longitude
        };
      };
    };
  };
}
