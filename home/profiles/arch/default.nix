{...}: {
  imports = [
    ../../../nix
    ../../wrapper/nixglprefix.nix
    ../../theme/fonts.nix

    ../../../wallpaper

    ../../theme/stylix.nix
    ../../programs
    ../../programs/wayland
    ../../programs/terminal/emulators/kitty.nix
    ../../programs/terminal/emulators/wezterm.nix

    ../../services/ags
    ../../services/media/playerctl.nix
    ../../services/system/kdeconnect.nix
    ../../services/system/polkit-agent.nix
    ../../services/system/power-monitor.nix
    ../../services/system/syncthing.nix
    ../../services/system/tailray.nix
    ../../services/system/udiskie.nix
  ];

  wayland.windowManager.hyprland.settings = {
    monitor = [
      "eDP-1,1920x1080@60,0x0,1"
      "HDMI-A-1,2560x1080@60,1920x0,1"
    ];
  };
}
