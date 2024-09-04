{
  config,
  pkgs,
  ...
}: let
  data = config.xdg.dataHome;
  conf = config.xdg.configHome;
  cache = config.xdg.cacheHome;
  passwordStoreDir = "${data}/password-store";
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
    fzf.enable = true;
    jq.enable = true;

    neovim = {
      enable = true;
    };

    # Terminal email client
    aerc.enable = true;
  };

  # Password
  programs.password-store = {
    enable = true;
    package = pkgs.pass.withExtensions (exts: [
      # [awesome-password-store](https://github.com/tijn/awesome-password-store)
      exts.pass-update # A pass extension that provides an easy flow for updating passwords
      exts.pass-import # A generic importer tool from other password managers
    ]);
    settings = {
      PASSWORD_STORE_DIR = passwordStoreDir;
      PASSWORD_STORE_CLIP_TIME = "60";
      PASSWORD_STORE_GENERATED_LENGTH = "15";
      PASSWORD_STORE_ENABLE_EXTENSIONS = "true";
    };
  };
  programs.browserpass = {
    enable = true;
    browsers = [
      "brave"
      "chrome"
      "chromium"
      "firefox"
    ];
  };

  home.packages = with pkgs; [
    imagemagick # Image manipulation
    just # Make like command runner
    neofetch # CLI information tool
    tmux # Terminal multiplexer
    tree-sitter # Language parser

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
    # zsh
    # file
    # which
    # tree
    # grim
    # tmux
    # yt-dlp
    # keepassxc
    # cmatrix
    # figlet
    # curl
    # gawk
    # glow

    #difftastic #TODO: Check
    # GUI

    # TODO: Check rly obsolete
    # wofi # Application launcher
  ];
}
