{config, ...}: {
  services.hyprpaper = {
    enable = true;

    settings = {
      preload = ["${config.opts.theme.wallpaper}"];
      wallpaper = [", ${config.opts.theme.wallpaper}"];
    };
  };
}
