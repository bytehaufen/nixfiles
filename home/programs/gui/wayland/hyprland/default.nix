{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: let
  hyperlandPkg = inputs.hyprland.packages.${pkgs.system}.default;
in {
  imports = [
    ./binds.nix
    ./rules.nix
    ./settings.nix
  ];

  home.packages = [pkgs.swaybg];

  xdg.portal = {
    enable = true;
    extraPortals = [
      # pkgs.xdg-desktop-portal-wlr
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
    ];

    config = {
      common = {
        default = [
          "gtk"
        ];
        "org.freedesktop.impl.portal.Secret" = [
          "gnome-keyring"
        ];
        # hyprland.default = ["wlr" "gtk"];
      };
      hyprland.default = ["gtk" "hyprland"];
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    package = hyperlandPkg;

    systemd = {
      enable = true;
      variables = ["--all"];
    };

    xwayland.enable = true;

    settings = {
      exec-once = [
        "${lib.getExe pkgs.swaybg} -m fill -i ${config.opts.theme.wallpaper}"
      ];
    };
  };

  home.file.".wayland-session" = {
    source = "${lib.getExe hyperlandPkg}";
    executable = true;
  };
}
