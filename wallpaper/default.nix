{
  lib,
  config,
  ...
}: {
  options.opts.theme.wallpaper = lib.mkOption {
    description = ''
      Location of the wallpaper to use throughout the system.
    '';
    type = lib.types.path;
    example = lib.literalExample "/home/foobar/.config/wallpaper/wallpaper.png";
    default = config.xdg.configHome + "/wallpaper/hyprland.png";
  };

  config.xdg.configFile = {
    "wallpaper/black_arch.png".source = ./black_arch.png;
    "wallpaper/avatar.jpg".source = ./avatar.jpg;
    "wallpaper/hyprland.png".source = ./hyprland.png;
  };
}
