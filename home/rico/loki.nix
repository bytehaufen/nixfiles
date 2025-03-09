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
      nchat.enable = true;
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

  programs = {
    ssh = {
      enable = true;
      extraConfig = ''
        Host svn
            HostName zapp2
            User costun
            IdentityFile /etc/ssh/id_ed25519_rico_work

        Host jira-tunnel
            HostName kif
            User costun
            IdentityFile /etc/ssh/id_ed25519_rico_work
            LocalForward 58080 127.0.0.1:58080

        Host confluence-tunnel
            HostName kif
            User costun
            IdentityFile /etc/ssh/id_ed25519_rico_work
            LocalForward 58090 127.0.0.1:58090

        Host gitlab-tunnel
            HostName elzar
            LocalForward 59080 127.0.0.1:59080
            User costun
            IdentityFile /etc/ssh/id_ed25519_rico_work
      '';
    };
  };
}
