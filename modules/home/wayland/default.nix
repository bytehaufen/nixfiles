{pkgs, ...}: {
  imports = [
    ./anyrun
    ./hyprland
    ./mako
    ./swayidle.nix
    ./swaylock.nix
    ./waybar
  ];

  home.packages = with pkgs; [
    adwaita-icon-theme # Icon theme
    brightnessctl # Brightness control
    dconf # Configuration system
    libsForQt5.qt5ct # Qt5 configuration tool
    libva # Video Acceleration API
    mako # Notification daemon
    meson # Build system
    morewaita-icon-theme # Icon theme
    networkmanagerapplet # Provide GUI app: nm-connection-editor
    pipewire # Multimedia framework
    qogir-icon-theme # Icon theme
    wayland-utils # Utilities for Wayland
    wayland-protocols # Wayland protocols
    wireplumber # Media session manager for PipeWire
    wlroots # Modular Wayland compositor library
    xwayland # X11 compatibility layer for Wayland
  ];

  # # TODO: Move to parent
  home.sessionVariables = {
    GTK_USE_PORTAL = 1;
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";

    LIBVA_DRIVER_NAME = "iHD";
    MOZ_ENABLE_WAYLAND = "1";
    WLR_DRM_NO_MODIFIERS = "1";
  };
}
