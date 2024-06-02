{
  pkgs,
  config,
  ...
}: let
  nixTools = with pkgs; [
    nix-output-monitor # nom
    # cachix
    lorri
  ];

  # TODO: Config this
  cliTools = with pkgs; [
    # Standard tools
    just # Make like command runner
    neofetch # CLI information tool
    tree-sitter # Language parser
    imagemagick # Image manipulation
    luajit # Lua JIT compiler
    # cacert
    #(git.override { openssl = pkgs.openssl_1_1; })
    # openssl
    # git
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
    qutebrowser # Web browser
    discord # Discord client
    wofi # Application launcher
    #xdg-utils # XDG utilities
  ];
in
  nixTools ++ cliTools ++ guiTools
