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

  wayland.windowManager.hyprland = {
    enable = true;
    package = hyperlandPkg;

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
        "${lib.getExe pkgs.swaybg} -m fill -i ${config.opts.theme.wallpaper}"
      ];
    };
  };
}
