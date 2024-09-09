{...}: {
  imports = [
    # Nixpkgs config
    ../../../nix

    # Core
    ../../core/xkb

    # NixGL
    ../../wrapper/nixglprefix.nix

    # Theming
    ../../theme/fonts.nix
    ../../theme/theme.nix
    ../../../wallpaper

    # Programs - GUI
    ../../programs/gui
    ../../programs/gui/anyrun

    ../../programs/gui/browsers/qutebrowser.nix

    ../../programs/gui/browsers/brave.nix
    ../../programs/gui/emulators/default.nix
    ../../programs/gui/media/default.nix
    ../../programs/gui/office/default.nix
    ../../programs/gui/office/zathura.nix
    ../../programs/gui/social/discord.nix
    ../../programs/gui/terminal/kitty.nix
    ../../programs/gui/terminal/wezterm.nix
    ../../programs/gui/wayland/default.nix

    # Programs - TUI
    ../../programs/tui
    ../../programs/tui/fastfetch.nix
    ../../programs/tui/nnn
    ../../programs/tui/neovim
    ../../programs/tui/shell/starship.nix
    ../../programs/tui/shell/zoxide.nix
    ../../programs/tui/shell/zsh.nix
    ../../programs/tui/bat
    ../../programs/tui/btop.nix
    ../../programs/tui/cli.nix
    ../../programs/tui/git.nix
    ../../programs/tui/nix.nix
    ../../programs/tui/password-mangement.nix
    ../../programs/tui/skim.nix
    ../../programs/tui/transient-services.nix
    ../../programs/tui/tmux
    ../../programs/tui/xdg.nix
    ../../programs/tui/yazi
    ../../programs/tui/zellij

    # Services
    ../../services/media/playerctl.nix
    ../../services/system/gnome-keyring.nix
    ../../services/system/kdeconnect.nix
    ../../services/system/polkit-agent.nix
    ../../services/system/power-monitor.nix
    ../../services/system/syncthing.nix
    ../../services/system/tailray.nix
    ../../services/system/udiskie.nix

    ../../services/wayland/ags.nix
    # TODO: Enable
    # ../../services/wayland/hypridle.nix
    # TODO: Enable
    # ../../services/wayland/hyprpaper.nix
  ];

  wayland.windowManager.hyprland.settings = {
    monitor = [
      "eDP-1,1920x1080@60,0x0,1"
      "HDMI-A-1,2560x1080@60,1920x0,1"
    ];
  };
}
