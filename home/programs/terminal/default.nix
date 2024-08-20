{
  config,
  pkgs,
  ...
}: let
  data = config.xdg.dataHome;
  conf = config.xdg.configHome;
  cache = config.xdg.cacheHome;
in {
  imports = [
    ./programs
    ./shell/starship.nix
    ./shell/zsh.nix
    ./shell/zoxide.nix
  ];

  # add environment variables
  home.sessionVariables = {
    # clean up ~
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
  home.packages = with pkgs; [
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
    tealdeer # tldr
    ripgrep # Fast grep
    eza # ls alternative
    fd # Fast find

    exiftool # Metadata
    yazi # Terminal file manager
    bat # Cat clone
    fd # Find clone
    zoxide # Cd clone
    # igrep # Interactive grep
    dust # Disk usage
    zoxide # Intelligent cd
    hexyl # Hex viewer
    lazydocker # Docker manager

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
