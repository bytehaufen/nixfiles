{vars, ...}: {
  imports = [
    # User services
    ../services

    # Nixpkgs config
    ../core/nix.nix

    # NixGL
    ../wrapper/nixGL.nix

    # Theming
    ../theme/fonts.nix
    ../theme/theme.nix
    ../../wallpaper

    # Programs - TUI
    ../programs/tui
    ../programs/tui/fastfetch.nix
    ../programs/tui/nnn
    ../programs/tui/neovim
    ../programs/tui/shell/starship.nix
    ../programs/tui/shell/zoxide.nix
    ../programs/tui/shell/zsh.nix
    ../programs/tui/bat
    ../programs/tui/btop.nix
    ../programs/tui/cli.nix
    ../programs/tui/git.nix
    ../programs/tui/nix.nix
    ../programs/tui/password-management.nix
    ../programs/tui/skim.nix
    ../programs/tui/tex.nix
    ../programs/tui/tmux
    ../programs/tui/transient-services.nix
    ../programs/tui/xdg.nix
    ../programs/tui/yazi
    ../programs/tui/zellij
  ];

  programs.home-manager.enable = true;

  home = {
    inherit (vars) username;
    homeDirectory = "/home/${vars.username}";
    stateVersion = "24.11";
    extraOutputsToInstall = ["doc" "devdoc"];

    # Lang
    sessionVariables = {
      LANG = "en_US.UTF-8";
      LC_ALL = "en_US.UTF-8";
      LC_CTYPE = "en_US.UTF-8";
      LC_NUMERIC = "de_DE.UTF-8";
      LC_COLLATE = "de_DE.UTF-8";
      LC_TIME = "de_DE.UTF-8";
      LC_MESSAGES = "de_DE.UTF-8";
      LC_MONETARY = "de_DE.UTF-8";
      LC_ADDRESS = "de_DE.UTF-8";
      LC_IDENTIFICATION = "de_DE.UTF-8";
      LC_MEASUREMENT = "de_DE.UTF-8";
      LC_PAPER = "de_DE.UTF-8";
      LC_TELEPHONE = "de_DE.UTF-8";
      LC_NAME = "de_DE.UTF-8";
    };
  };
  news.display = "silent";
  manual.manpages.enable = true;
}
