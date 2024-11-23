{
  lib,
  vars,
  ...
}: {
  imports = [
    ./core.nix

    # Programs - GUI
    ../programs/gui

    # TODD2 specific
    ./todd2
  ];

  opts = {
    programs.teams.enable = true;
    services = {
      gnome-keyring.enable = true;
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

  programs.home-manager.enable = true;

  home = {
    inherit (vars) username;
    homeDirectory = "/home/${vars.username}";
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
