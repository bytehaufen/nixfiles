{
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    ./binds.nix
    ./rules.nix
    ./settings.nix
  ];

  home.packages = [pkgs.swaybg];

  programs.zsh.shellAliases = {
    xkill = "${lib.getExe' config.wayland.windowManager.hyprland.package "hyprctl"} kill";
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-wlr
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
      hyprland.default = ["gtk" "wlr"];
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;

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
      ];
    };
  };

  home.file.".wayland-session" = {
    source = "${lib.getExe pkgs.hyprland}";
    executable = true;
  };
}
