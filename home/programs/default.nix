{pkgs, ...}: {
  imports = [
    ./cli
    ./gui
  ];
  home.packages = with pkgs; [
    # Nix
    nix-output-monitor # nom
    cachix # Cachix
    lorri # Nix project  development environment
    nil # Nix language server
    #

    # TODO: Config this
    # Terminal
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
    luajitPackages.magick # Lua bindings for ImageMagick
    viu # Image viewer
    chafa # Image to ASCII converter
    ueberzugpp # Image viewer
    delta # Git diff viewer
    inkscape # Vector graphics editor
    sd # Fast sed
    mpv # Media player
    tealdeer # tldr
    ripgrep # Fast grep
    eza # ls alternative
    fd # Fast find

    exiftool # Metadata
    yazi # Terminal file manager
    bat # Cat clone
    fd # Find clone
    dust # Du clone
    zoxide # Cd clone
    igrep # Interactive grep
    dust #
    zoxide # Intelligent cd
    zellij # Terminal multiplexer
    hexyl # Hex viewer

    # zip
    # unzip
    # zsh
    # file
    # which
    # tree
    # grim
    # tmux
    # yt-dlp
    # keepassxc
    # zathura
    # cmatrix
    # figlet
    # curl
    # gawk
    # glow

    #difftastic #TODO: Check
    # GUI
    qutebrowser # Web browser
    discord # Discord client
    wofi # Application launcher
    wezterm # Terminal emulator
    #xdg-utils # XDG utilities # TODO: CHECK
  ];
}
