{
  lib,
  config,
  ...
}: {
  options.opts.home.theme.wallpaper = lib.mkOption {
    description = ''
      Location of the wallpaper to use throughout the system.
    '';
    type = lib.types.path;
    example = lib.literalExample "/home/foobar/.config/wallpaper/wallpaper.png";
    default = config.xdg.configHome + "/images/hyprland.png";
  };

  # Make my images available under $XDG_CONFIG_HOME/images, so that they can be
  # set manually in applications
  config.xdg.configFile = {
    "images/avatar.jpg".source = ./avatar.jpg;
    "images/hyprland.png".source = ./hyprland.png;
  };
}
