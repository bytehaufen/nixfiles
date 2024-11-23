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

    # Programs - TUI
    ../programs/tui
    ../programs/tui/fastfetch.nix
    ../programs/tui/nnn
    ../programs/tui/neovim
    ../programs/tui/shell/starship.nix
    ../programs/tui/shell/zoxide.nix
    ../programs/tui/shell/zsh.nix
    ../programs/tui/bat
    ../programs/tui/btop.nix
    ../programs/tui/cli.nix
    ../programs/tui/git.nix
    ../programs/tui/nix.nix
    ../programs/tui/password-management.nix
    ../programs/tui/skim.nix
    ../programs/tui/tex.nix
    ../programs/tui/tmux
    ../programs/tui/transient-services.nix
    ../programs/tui/xdg.nix
    ../programs/tui/yazi
    ../programs/tui/zellij
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
