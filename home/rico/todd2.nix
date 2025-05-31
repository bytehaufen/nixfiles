{lib, ...}: {
  imports = [
    ./core.nix

    # Work specific
    ./work
  ];

  opts = {
    programs.teams.enable = true;
    services = {
      syncthing.enable = true;
    };
    nixGL.enable = true;
  };

  programs = {
    kitty.settings.background_opacity = lib.mkForce 1.0;

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
