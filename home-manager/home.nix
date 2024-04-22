{ config, lib, pkgs, ... }: {
  imports = [ ./modules/cli/nnn/nnn.nix ];

  home = {
    username = "rico";
    homeDirectory = "/home/rico";
    stateVersion = "23.11";
    packages = with pkgs;
      [
        # TODO: Config this
        # Standard tools 
        # neofetch
        # zip
        # unzip
        # zsh
        # ripgrep
        # jq
        # eza
        # fzf
        # file
        # which
        # tree
        # bat
        # fd
        # grim
        # mpv
        # kitty
        # lazygit
        # tmux
        # yt-dlp
        # btop
        # keepassxc
        # zathura
        # cmatrix
        # tealdeer
        # figlet
        # curl
        # gawk
        # glow
        # qutebrowser

        # `nom` detailed nix replacement
        nix-output-monitor
      ];

    file = {
      # # Building this configuration will create a copy of 'dotfiles/screenrc' in
      # # the Nix store. Activating the configuration will then make '~/.screenrc' a
      # # symlink to the Nix store copy.
      # ".screenrc".source = dotfiles/screenrc;

      # # You can also set the file content immediately.
      # ".gradle/gradle.properties".text = ''
      #   org.gradle.console=verbose
      #   org.gradle.daemon.idletimeout=3600000
      # '';
    };

    sessionVariables = {
      # EDITOR = "emacs";
    };

    # TODO: 
    # services = {
    #     syncthing.enable = true;
    #   };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
