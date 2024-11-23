{...}: {
  imports = [
    ./common.nix

    # Programs - GUI
    ../programs/gui

    ../programs/gui/emulators/default.nix
    ../programs/gui/llvm/default.nix
    ../programs/gui/media/default.nix
    ../programs/gui/office/default.nix
    ../programs/gui/office/zathura.nix
    ../programs/gui/social/discord.nix
    ../programs/gui/terminal/kitty.nix
    # ../programs/gui/terminal/wezterm.nix # Not usable see [#5990](https://github.com/wez/wezterm/issues/5990)

    ../programs/gui/wayland/default.nix
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

    nixGL.enable = true;
  };

  wayland.windowManager.hyprland.settings = {
    monitor = [
      "eDP-1,1920x1080@60,0x0,1"
      "HDMI-A-1,2560x1080@60,1920x0,1"
    ];
  };
}
