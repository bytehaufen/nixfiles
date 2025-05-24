{...}: {
  imports = [
    ./core.nix

    # Programs - GUI
    ../programs/gui

    # Wayland - Hyprland
    ../programs/gui/wayland

    # TODD2 specific
    ./todd2
  ];

  opts = {
    programs = {
      teams.enable = true;
      discord.enable = true;
      nchat.enable = true;
    };

    services = {
      kdeconnect.enable = true;
      playerctl.enable = true;
      power-monitor.enable = true;
      syncthing.enable = true;
      udiskie.enable = true;
    };
  };

  wayland.windowManager.hyprland.settings = {
    monitor = [
      "eDP-1, preferred, auto, 1.2"
      "HDMI-A-1, preferred, auto-right, 1"
    ];
  };
}
