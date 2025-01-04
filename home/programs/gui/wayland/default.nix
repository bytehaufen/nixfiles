{pkgs, ...}: {
  imports = [
    ./hyprland
    ./swaylock.nix
    ./scripts
    ./waybar
    ./mako

    ./anyrun
    # ./ags

    ./xkb

    # FIXME: Configure
    # ./hyprlock.nix

    # TODO: Enable
    # ./hypridle.nix
    # TODO: Enable
    # ./hyprpaper.nix
  ];

  home.packages = with pkgs; [
    adwaita-icon-theme
    brightnessctl
    brillo # Brightness control
    dconf
    hyprshot
    libsForQt5.qt5ct
    libva
    mako # Notification daemon
    meson
    morewaita-icon-theme
    pipewire
    qogir-icon-theme
    wayland-utils
    wayland-protocols
    wireplumber
    wlroots
    xwayland
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
