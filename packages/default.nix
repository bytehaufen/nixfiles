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

    tmux
    github-cli # GitHub CLI
    rustc # Rust compiler
    cargo # Rust package manager
    rust-analyzer # Rust language server
    lua # Lua language
    fzf # Fuzzy finder
    viu # Image viewer
    chafa # Image to ASCII converter
    ueberzugpp # Image viewer
    delta # Git diff viewer
    # luajit # Lua JIT compiler
    # luajitPackages.magick
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

    #difftastic #TODO: Check
  ];

  guiTools = with pkgs; [
    qutebrowser # Web browser
    discord # Discord client
    wofi # Application launcher
    #xdg-utils # XDG utilities # TODO: CHECK
  ];
in
  nixTools ++ cliTools ++ guiTools
