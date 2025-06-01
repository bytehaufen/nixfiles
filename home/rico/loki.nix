{...}: {
  imports = [
    ./core.nix

    # Work specific
    ./work
  ];

  opts.home = {
    gui.enable = true;
    hyprland.enable = true;

    programs = {
      discord.enable = true;
      nchat.enable = true;
      obs.enable = true;
      teams.enable = true;
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
