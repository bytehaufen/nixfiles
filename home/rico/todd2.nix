{...}: {
  imports = [
    # Nixpkgs config
    ../../nix

    # Core
    ../core/xkb

    # NixGL
    ../wrapper/nixGL.nix

    # Theming
    ../theme/fonts.nix
    ../theme/theme.nix
    ../../wallpaper

    # Programs - GUI
    ../programs/gui

    ../programs/gui/browsers/brave.nix
    # ../programs/gui/browsers/firefox.nix
    ../programs/gui/browsers/qutebrowser.nix

    # ../programs/gui/emulators/default.nix
    ../programs/gui/media/default.nix
    ../programs/gui/neovide.nix
    ../programs/gui/office/default.nix
    ../programs/gui/office/zathura.nix

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
    ../programs/tui/transient-services.nix
    ../programs/tui/tmux
    ../programs/tui/xdg.nix
    ../programs/tui/yazi
    ../programs/tui/zellij

    # Services
    ../services/media/playerctl.nix
    ../services/system/gnome-keyring.nix
    ../services/system/kdeconnect.nix
    ../services/system/polkit-agent.nix
    ../services/system/power-monitor.nix
    ../services/system/syncthing.nix
    ../services/system/udiskie.nix

  ];

  programs = {
    teams.enable = true;

    ssh = {
      enable = true;
      extraConfig = ''
        Host svn
            HostName zapp2
            User costun
            IdentityFile ~/.ssh/ukro

        Host jira-tunnel
            HostName kif
            User costun
            IdentityFile ~/.ssh/ukro
            LocalForward 58080 127.0.0.1:58080

        Host confluence-tunnel
            HostName kif
            User costun
            IdentityFile ~/.ssh/ukro
            LocalForward 58090 127.0.0.1:58090

        Host gitlab-tunnel
            HostName elzar
            LocalForward 59080 127.0.0.1:59080
            User costun
            IdentityFile ~/.ssh/ukro
      '';
    };
  };

  wayland.windowManager.hyprland.settings = {
    monitor = [
      "eDP-1,1920x1080@60,0x0,1"
      "HDMI-A-1,2560x1080@60,1920x0,1"
    ];
  };

  programs.home-manager.enable = true;

  home = {
    username = "rico";
    homeDirectory = "/home/rico";
    stateVersion = "24.11";
    extraOutputsToInstall = ["doc" "devdoc"];

    # Lang
    sessionVariables = {
      LANG = "en_US.UTF-8";
      LC_ALL = "en_US.UTF-8";
      LC_CTYPE = "en_US.UTF-8";
      LC_NUMERIC = "de_DE.UTF-8";
      LC_COLLATE = "de_DE.UTF-8";
      LC_TIME = "de_DE.UTF-8";
      LC_MESSAGES = "de_DE.UTF-8";
      LC_MONETARY = "de_DE.UTF-8";
      LC_ADDRESS = "de_DE.UTF-8";
      LC_IDENTIFICATION = "de_DE.UTF-8";
      LC_MEASUREMENT = "de_DE.UTF-8";
      LC_PAPER = "de_DE.UTF-8";
      LC_TELEPHONE = "de_DE.UTF-8";
      LC_NAME = "de_DE.UTF-8";
    };
  };
  news.display = "silent";
  manual.manpages.enable = true;
}
