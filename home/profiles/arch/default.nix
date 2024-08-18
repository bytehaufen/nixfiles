{
  config,
  lib,
  ...
}: {
  imports = [
    ../../../nix
    ../../wrapper/nixglprefix.nix

    ../../theme/stylix.nix
    ../../programs
    ../../programs/wayland

    # ../../services/ags
    # ../../services/media/playerctl.nix
    # ../../services/ags
    # ../../services/ags
    # ../../services/ags
  ];

  wayland.windowManager.hyprland.settings = {
    monitor = [
      "eDP-1,1920x1080@60,0x0,1"
      "HDMI-A-1,2560x1080@60,1920x0,1"
    ];
  };
}
