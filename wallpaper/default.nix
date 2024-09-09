{
  lib,
  config,
  ...
}: {
  options.theme.wallpaper = lib.mkOption {
    description = ''
      Location of the wallpaper to use throughout the system.
    '';
    type = lib.types.path;
    example = lib.literalExample "/home/foobar/.config/wallpaper/wallpaper.png";
    default = config.xdg.configHome + "/wallpaper/black_arch.png";
  };

  config.xdg.configFile."wallpaper/black_arch.png".source = ./black_arch.png;
  config.xdg.configFile."wallpaper/avatar.jpg".source = ./avatar.jpg;
}
