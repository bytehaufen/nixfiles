{pkgs, ...}: let
  joinedPortals = pkgs.symlinkJoin {
    name = "xdg-portals";
    paths = [
      pkgs.gnome-remote-desktop
      pkgs.gnome-shell
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
    ];
  };
in {
  imports = [
    ./hyprland
    ./swaylock.nix
    ./scripts

    ../anyrun
    ../../../services/wayland/ags

    # FIXME: Configure
    # ./hyprlock.nix

    # TODO: Enable
    # ../../../services/wayland/hypridle.nix
    # TODO: Enable
    # ../../../services/wayland/hyprpaper.nix
  ];

  home.packages = with pkgs; [
    libvdpau-va-gl
    vpl-gpu-rt
    intel-media-driver
    intel-compute-runtime
    v4l-utils
    ffmpeg
    libcamera

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
    swaybg
    morewaita-icon-theme
    adwaita-icon-theme
    qogir-icon-theme
  ];

  # # TODO: Move to parent
  home.sessionVariables = {
    XDG_DESKTOP_PORTAL_DIR = "${joinedPortals}/share/xdg-desktop-portal/portals";
    GTK_USE_PORTAL = 1;
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";

    LIBVA_DRIVER_NAME = "iHD";
    MOZ_ENABLE_WAYLAND = "1";
    WLR_DRM_NO_MODIFIERS = "1";
  };

  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-wlr pkgs.xdg-desktop-portal-gtk];
    config.hyprland.default = ["wlr" "gtk"];
  };
}
