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
      gnome-keyring.enable = true;
      kdeconnect.enable = true;
      playerctl.enable = true;
      polkit-agent.enable = true;
      power-monitor.enable = true;
      syncthing.enable = true;
      udiskie.enable = true;
    };
    programs = {
      discord.enable = true;
    };
  };
}
