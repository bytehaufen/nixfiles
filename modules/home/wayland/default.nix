{lib, ...}: {
  imports = [
    ./anyrun
    ./hyprland
    ./mako
    ./packages.nix
    ./swayidle.nix
    ./swaylock.nix
    ./waybar
  ];

  options.opts.hyprland = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable the Hyprland Wayland compositor configuration.";
    };
  };

  # # TODO: Move to parent
  config.home.sessionVariables = {
    GTK_USE_PORTAL = 1;
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";

    LIBVA_DRIVER_NAME = "iHD";
    MOZ_ENABLE_WAYLAND = "1";
    WLR_DRM_NO_MODIFIERS = "1";
  };
}
