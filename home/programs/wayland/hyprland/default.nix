{
  pkgs,
  config,
  ...
}: let
  nixGL = import ../../../wrapper/nixGL.nix {inherit pkgs config;};
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
    qt5ct
    libva
    dconf
    wayland-utils
    wayland-protocols
    meson
    swaybg
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-gnome
    xdg-desktop-portal-hyprland
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
  };

  # Move too
  xdg.portal = {
    config = {
      common = {
        default = ["gtk"];
        "org.freedesktop.impl.portal.Secret" = ["gnome-keyring"];
      };
    };
    enable = true;
    xdgOpenUsePortal = false;
    extraPortals = with pkgs; [
      xdg-desktop-portal
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];
  };

  wayland.windowManager.hyprland = {
    enable = true;
    package = nixGL pkgs.hyprland;
    systemd = {
      enable = true;
      variables = ["--all"];
    };

    xwayland.enable = true;

    settings = {
      exec-once = [
        "swaybg -m fill -i ${config.stylix.image}"
      ];

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
