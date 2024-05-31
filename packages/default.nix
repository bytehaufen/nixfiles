{pkgs, ...}: let
  nixTools = with pkgs; [
    nix-output-monitor # nom
    cachix
    lorri
  ];

  # TODO: Config this
  cliTools = with pkgs; [
    # Standard tools
    just # Make like command runner
    neofetch # CLI information tool
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
    discord
  ];
in
  nixTools ++ cliTools ++ guiTools
