{vars, ...}: {
  imports = [
    # User services
    ../services

    # NixGL
    ../wrapper/nixGL.nix

    # Theming
    ../theme
    ../../wallpaper

    # TUI programs
    ../programs/tui
  ];

  programs.home-manager.enable = true;

  home = {
    inherit (vars) username;
    homeDirectory = "/home/${vars.username}";
    stateVersion = "24.11";
    extraOutputsToInstall = ["doc" "devdoc"];
  };
  news.display = "silent";
  manual.manpages.enable = true;
}
