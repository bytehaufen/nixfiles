{lib, ...}: {
  imports = [./hyprland ./kitty ./wezterm.nix];
  # Workaround for missing home-manager config. See PR [#5355](https://github.com/nix-community/home-manager/pull/5355)
  options.nixGLPrefix = lib.mkOption {
    type = lib.types.str;
    default = "";
    description = ''
      Will be prepended to commands which require working OpenGL.

      This needs to be set to the right nixGL package on non-NixOS systems.
    '';
  };
}
