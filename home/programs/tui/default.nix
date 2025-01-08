{
  config,
  pkgs,
  ...
}: let
  conf = config.xdg.configHome;
  cache = config.xdg.cacheHome;
in {
  imports = [
    ./bat
    ./mail.nix
    ./neovim
    ./tmux
    ./yazi
    ./zellij
    ./fastfetch.nix
    ./starship.nix
    ./zoxide.nix
    ./zsh.nix
    ./btop.nix
    ./cli.nix
    ./git.nix
    ./nix.nix
    ./gpg
    ./packages.nix
    ./ssh.nix
    ./skim.nix
    ./transient-services.nix
    ./xdg.nix
  ];

  # Add environment variables
  home.sessionVariables = {
    # TODO: Clean up ~
    LESSHISTFILE = "${cache}/less/history";
    LESSKEY = "${conf}/less/lesskey";
  };

  programs = {
    # Type `<ctrl> + r` to fuzzy search your shell history
    jq.enable = true;

    # Terminal email client
    aerc.enable = true;

    eza = {
      enable = true;
      enableNushellIntegration = false;
      git = true;
      icons = "auto";
    };

    # A command-line fuzzy finder
    fzf = {
      enable = true;
      colors = {
        "bg+" = "#283457";
        "bg" = "#16161e";
        "border" = "#27a1b9";
        "fg" = "#c0caf5";
        "gutter" = "#16161e";
        "header" = "#ff9e64";
        "hl+" = "#2ac3de";
        "hl" = "#2ac3de";
        "info" = "#545c7e";
        "marker" = "#ff007c";
        "pointer" = "#ff007c";
        "prompt" = "#2ac3de";
        "query" = "#c0caf5:regular";
        "scrollbar" = "#27a1b9";
        "separator" = "#ff9e64";
        "spinner" = "#ff007c";
      };
    };
  };

  home.packages = with pkgs; [
    imagemagick # Image manipulation
    tree-sitter # Language parser

    ## Development
    just # Make like command runner
    libcap # POSIX capabilities

    viu # Image viewer
    chafa # Image to ASCII converter
    ueberzugpp # Image viewer
    inkscape # Vector graphics editor
    sd # Fast sed
    tealdeer # tldr
    eza # ls alternative
    fd # Fast find

    exiftool # Metadata
    dust # Disk usage
    hexyl # Hex viewer
    lazydocker # Docker manager

    hyperfine # Benchmarking

    detox # Harmonize file names
    # zip
    # unzip
    # file
    # which
    # tree
    # grim
    # yt-dlp
    cmatrix # Terminal screensaver
    # figlet
    # curl
    # gawk
    # glow

    #difftastic #TODO: Check
  ];
}
