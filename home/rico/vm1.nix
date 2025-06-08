{...}: {
  imports = [
    ./core.nix
    ./work
  ];

  opts.home = {
    gui.enable = true;
    nixGL.enable = true;
    windowManager.hyprland.enable = true;

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
}
