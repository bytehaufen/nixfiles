{...}: {
  imports = [
    ./core.nix
    ./work
    ./todd2

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
      teams.enable = true;
    };
    nixGL.enable = true;
  };
}
