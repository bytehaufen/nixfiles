{
  pkgs,
  config,
  lib,
  ...
}: let
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
    ./binds.nix
    ./rules.nix
    ./settings.nix
  ];

  home.packages = with pkgs; [
    brillo # Brightness control
    hyprshot
    wlr-randr
    wl-clipboard
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

  # Move too
  # xdg.portal = {
  #   config = {
  #     common = {
  #       default = ["hyprland" "gtk"];
  #       # "org.freedesktop.impl.portal.Secret" = ["gnome-keyring"];
  #     };
  #   };
  #   enable = true;
  #   xdgOpenUsePortal = true;
  #   extraPortals = with pkgs; [
  #     xdg-desktop-portal
  #     xdg-desktop-portal-gtk
  #     # xdg-desktop-portal-gnome
  #     xdg-desktop-portal-hyprland
  #   ];
  # };
  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-wlr pkgs.xdg-desktop-portal-gtk];
    config.hyprland.default = ["wlr" "gtk"];
  };

  wayland.windowManager.hyprland = {
    enable = true;
    package = config.lib.nixGL.wrap (pkgs.hyprland.override {wrapRuntimeDeps = false;});
    systemd = {
      enable = true;
      variables = ["--all"];
      extraCommands = lib.mkBefore [
        "systemctl --user stop graphical-session.target"
        "systemctl --user start hyprland-session.target"
      ];
    };

    xwayland.enable = true;

    settings = {
      exec-once = [
        "swaybg -m fill -i ${config.theme.wallpaper}"
      ];

      # FIXME: What to do with this?

      # windowrule = [
      #   "float,title:^(Open File)(.*)$"
      #   "float,title:^(Open Folder)(.*)$"
      #   "float,title:^(Save As)(.*)$"
      #   "float,title:^(Library)(.*)$ "
      # ];

      # windowrulev2 = [
      #   "float, class:^wofi"
      #   "size 60% 70%, class:^wofi"
      #   "size 50% 20%, class:^wofi-(browser|emoji)$"
      #   "center, class:^wofi"
      #   "float, class:^pavucontrol"
      #   "size 60% 70%, class:^pavucontrol"
      #   "center, class:^pavucontrol"
      #   "rounding 10, floating:1"
      # ];
    };
  };
}
