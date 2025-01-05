{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: let
  hyprlandPkg = inputs.hyprland.packages.${pkgs.system};
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
      pkgs.xdg-desktop-portal-gtk
      hyprlandPkg.xdg-desktop-portal-hyprland
    ];

    config = {
      common = {
        default = [
          "gtk"
        ];
        "org.freedesktop.impl.portal.Secret" = [
          "gnome-keyring"
        ];
      };
      hyprland.default = ["gtk" "hyprland"];
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    package = hyprlandPkg.hyprland;

    systemd = {
      enable = true;
      variables = ["--all"];
    };

    xwayland.enable = true;

    settings = {
      exec-once = [
        "${lib.getExe pkgs.swaybg} -m fill -i ${config.opts.theme.wallpaper}"
        "${pkgs.networkmanagerapplet}/bin/nm-applet"
        "${pkgs.blueman}/bin/blueman-applet"
      ];

      exec = [
        "pkill waybar; ${lib.getExe pkgs.waybar}"
      ];
    };
  };

  home.file.".wayland-session" = {
    source = "${lib.getExe hyprlandPkg.hyprland}";
    executable = true;
  };
}
