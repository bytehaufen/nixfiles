{pkgs, ...}: let
  nixTools = with pkgs; [
    nix-output-monitor # nom
    cachix
    lorri
  ];

  # TODO: Config this
  cliTools = with pkgs; [
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
    # fd
    # grim
    # mpv
    # kitty
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

    #difftastic
  ];

  guiTools = with pkgs; [
    # qutebrowser
  ];
in
  nixTools ++ cliTools ++ guiTools
