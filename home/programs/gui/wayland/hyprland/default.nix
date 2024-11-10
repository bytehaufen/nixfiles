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
    };
  };
}
