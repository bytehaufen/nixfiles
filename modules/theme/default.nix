{lib, ...}: {
  options = {
    theme = lib.mkOption {
      type = lib.types.str;
      description = "Set the theme";
      example = lib.literalExample "catpuccin-mocha";
    };
    wallpaper = lib.mkOption {
      type = lib.types.path;
      description = "Set the wallpaper path";
    };
  };
}
