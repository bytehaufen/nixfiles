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
    };

    services = {
      gnome-keyring.enable = true;
      kdeconnect.enable = true;
      playerctl.enable = true;
      polkit-agent.enable = true;
      power-monitor.enable = true;
      syncthing.enable = true;
      udiskie.enable = true;
    };
  };

  wayland.windowManager.hyprland.settings = {
    monitor = [
      "eDP-1,1920x1080@60,0x0,1"
      "HDMI-A-1,2560x1080@60,1920x0,1"
    ];
  };

  programs = {
    ssh = {
      enable = true;
      # FIXME: Use `/etc/ssh` instead
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
}
