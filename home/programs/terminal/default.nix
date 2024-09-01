{
  config,
  pkgs,
  ...
}: let
  data = config.xdg.dataHome;
  conf = config.xdg.configHome;
  cache = config.xdg.cacheHome;
  passwordStoreDir = "${data}/password-store"; # FIXME: Setting a custom dir doesn't work
in {
  imports = [
    ./programs
    ./shell/starship.nix
    ./shell/zsh.nix
    ./shell/zoxide.nix
  ];

  # Add environment variables
  home.sessionVariables = {
    # Clean up ~
    LESSHISTFILE = "${cache}/less/history";
    LESSKEY = "${conf}/less/lesskey";

    WINEPREFIX = "${data}/wine";
    XAUTHORITY = "$XDG_RUNTIME_DIR/Xauthority";

    EDITOR = "nvim";
    DIRENV_LOG_FORMAT = "";

    # auto-run programs using nix-index-database
    NIX_AUTO_RUN = "1";
  };
  programs = {
    # Type `z <pat>` to cd to some directory
    zoxide.enable = true;

    # Type `<ctrl> + r` to fuzzy search your shell history
    fzf.enable = true;
    jq.enable = true;

    neovim = {
      enable = true;
    };

    ## TODO: Enable
    # bash = {
    #   enable = true;
    #   initExtra = ''
    #     # Make Nix and home-manager installed things available in PATH.
    #     . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
    #     export PATH=/run/current-system/sw/bin/:/nix/var/nix/profiles/default/bin:$HOME/.nix-profile/bin:/etc/profiles/per-user/$USER/bin:$PATH
    #   '';
    # };
    #
    # zsh = {
    #   enable = true;
    #   autosuggestion.enable = true;
    #   syntaxHighlighting.enable = true;
    #   envExtra = ''
    #     # Make Nix and home-manager installed things available in PATH.
    #     . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
    #     export PATH=/run/current-system/sw/bin/:/nix/var/nix/profiles/default/bin:$HOME/.nix-profile/bin:/etc/profiles/per-user/$USER/bin:$PATH
    #   '';
    # };

    # TODO:
    # zsh.enable = true;

    # TODO:
    #git.enable = true;
  };

  # Brave
  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    commandLineArgs = [
      "--enable-features=UseOzonePlatform"
      "--ozone-platform=wayland"
      "--password-store=basic"
    ];
  };

  # Terminal email client
  programs.aerc.enable = true;

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
  services.gnome-keyring.enable = true;

  home.packages = with pkgs; [
    nix-output-monitor # nom
    cachix # Cachix
    lorri # Nix project  development environment
    nil # Nix language server

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
    tealdeer # tldr
    ripgrep # Fast grep
    eza # ls alternative
    fd # Fast find

    exiftool # Metadata
    bat # Cat clone
    fd # Find clone
    zoxide # Cd clone
    # igrep # Interactive grep # FIXME: Currently broken
    dust # Disk usage
    zoxide # Intelligent cd
    hexyl # Hex viewer
    lazydocker # Docker manager

    spotube # Spotify client

    keepassxc # Password manager
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
    discord # Discord client
    wofi # Application launcher

    # Emulators
    wineWowPackages.waylandFull # Windows compatibility layer
    winetricks # Windows compatibility layer
  ];
}
