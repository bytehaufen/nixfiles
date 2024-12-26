{pkgs, ...}: {
  imports = [
    ./hyprland
    ./swaylock.nix
    ./scripts

    ./anyrun
    ./ags

    ./xkb

    # FIXME: Configure
    # ./hyprlock.nix

    # TODO: Enable
    # ./hypridle.nix
    # TODO: Enable
    # ./hyprpaper.nix
  ];

  home.packages = with pkgs; [
    brillo # Brightness control
    hyprshot
    brightnessctl
    xwayland
    wlroots
    libsForQt5.qt5ct
    libva
    dconf
    pipewire
    wireplumber
    wayland-utils
    wayland-protocols
    meson
    morewaita-icon-theme
    adwaita-icon-theme
    qogir-icon-theme
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
