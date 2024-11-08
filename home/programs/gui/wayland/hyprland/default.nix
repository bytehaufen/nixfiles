{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./binds.nix
    ./rules.nix
    ./settings.nix
  ];

  systemd.user.services.xdg-desktop-portal-hyprland = {
    Unit.Description = "xdg-desktop-portal backend for Hyprland";

    Install = {
      WantedBy = ["graphical-session.target"];
    };

    Service = {
      Type = "simple";
      ExecStart = "${pkgs.xdg-desktop-portal-hyprland}/libexec/xdg-desktop-portal-hyprland";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };

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
    wayland-utils
    wayland-protocols
    meson
    swaybg
    xdg-desktop-portal
    # xdg-desktop-portal-gtk
    # xdg-desktop-portal-gnome
    xdg-desktop-portal-hyprland
    morewaita-icon-theme
    adwaita-icon-theme
    qogir-icon-theme

    pipewire
    wireplumber
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

  # Move too
  xdg.portal = {
    config = {
      common = {
        default = ["hyprland"];
        # "org.freedesktop.impl.portal.Secret" = ["gnome-keyring"];
      };
      hyprland = {
        default = ["hyprland" "gtk"];
      };
    };
    enable = true;
    # Sets environment variable NIXOS_XDG_OPEN_USE_PORTAL to 1 This will make xdg-open use the
    # portal to open programs, which resolves bugs involving programs opening inside FHS envs or with
    #   unexpected env vars set from wrappers. See #160923 for more info.
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal
      # xdg-desktop-portal-gtk
      # xdg-desktop-portal-gnome
      xdg-desktop-portal-hyprland
    ];
  };

  wayland.windowManager.hyprland = {
    enable = true;
    package = config.lib.nixGL.wrap pkgs.hyprland;
    systemd = {
      enable = true;
      # This will make sure that `xdg-desktop-portal-hyprland` will get the required variables on
      # startup
      variables = ["--all"];
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
