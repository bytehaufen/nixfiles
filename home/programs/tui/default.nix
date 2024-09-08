{
  config,
  pkgs,
  ...
}: let
  data = config.xdg.dataHome;
  conf = config.xdg.configHome;
  cache = config.xdg.cacheHome;
in {
  # Add environment variables
  home.sessionVariables = {
    # Clean up ~
    LESSHISTFILE = "${cache}/less/history";
    LESSKEY = "${conf}/less/lesskey";

    WINEPREFIX = "${data}/wine";

    EDITOR = "nvim";
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
      icons = true;
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
    just # Make like command runner
    tree-sitter # Language parser

    rustc # Rust compiler
    cargo # Rust package manager
    rust-analyzer # Rust language server
    lua # Lua language
    luajitPackages.magick # Lua bindings for ImageMagick
    viu # Image viewer
    chafa # Image to ASCII converter
    ueberzugpp # Image viewer
    inkscape # Vector graphics editor
    sd # Fast sed
    tealdeer # tldr
    ripgrep # Fast grep
    eza # ls alternative
    fd # Fast find

    exiftool # Metadata
    fd # Find clone
    # igrep # Interactive grep # FIXME: Currently broken
    dust # Disk usage
    zoxide # Intelligent cd
    hexyl # Hex viewer
    lazydocker # Docker manager

    nodejs_22
    # zip
    # unzip
    # file
    # which
    # tree
    # grim
    # yt-dlp
    # keepassxc
    # cmatrix
    # figlet
    # curl
    # gawk
    # glow

    #difftastic #TODO: Check
    # GUI
  ];
}