{lib, ...}: {
  imports = [./hyprland];
  # Workaround for missing home-manager config. See PR [#5355](https://github.com/nix-community/home-manager/pull/5355)
  options.nixGLPrefix = lib.mkOption {
    type = lib.types.str;
    default = "";
    description = ''
      Will be prepended to commands which require working OpenGL.

      This needs to be set to the right nixGL package on non-NixOS systems.
    '';
  };

  # TODO:
  # Add plugin configs:
  # waybar

  # TODO:
  # xdg = {
  #   portal = {
  #     enable = true;
  #     extraPortals = with pkgs; [
  #       xdg-desktop-portal-wlr
  #     ];
  #   };
  # };
}
