{...}: {
  imports = [
    ./core.nix
    ./work
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
      teams.enable = true;
    };
    nixGL.enable = true;
  };
}
