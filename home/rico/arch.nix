{...}: {
  imports = [
    ./core.nix

    # Programs - GUI
    ../programs/gui

    # Wayland - Hyprland
    ../programs/gui/wayland
  ];
  opts = {
    services = {
      kdeconnect.enable = true;
      playerctl.enable = true;
      power-monitor.enable = true;
      syncthing.enable = true;
      udiskie.enable = true;
    };

    programs = {
      discord.enable = true;
    };

    nixGL.enable = true;
  };

  wayland.windowManager.hyprland.settings = {
    monitor = [
      "eDP-1,1920x1080@60,0x0,1"
      "HDMI-A-1,2560x1080@60,1920x0,1"
    ];
  };
}
