{
  config,
  pkgs,
  ...
}: let
  defaultApplications = {
    # TODO: Add default applications
  };
in {
  xdg = {
    enable = true;
    cacheHome = config.home.homeDirectory + "/.local/cache";

    mime.enable = true;

    # FIXME: Extract this from ~/.config/mimeapps.list
    # mimeApps = {
    #   enable = true;
    #   defaultApplications = defaultApplications;
    # };

    systemDirs.data = ["${config.home.homeDirectory}/.nix-profile/share/applications" "${config.home.homeDirectory}/.nix-profile/share/"];

    # FIXME: Merge with system configuration
    # userDirs = {
    #   enable = true;
    #   createDirectories = true;
    #   extraConfig = {
    #     XDG_SCREENSHOTS_DIR = "${config.xdg.userDirs.pictures}/Screenshots";
    #   };
    # };
  };

  home.packages = [
    # used by `gio open` and xdg-gtk
    (pkgs.writeShellScriptBin "xdg-terminal-exec" ''
      kitty "$@"
    '')
    pkgs.xdg-utils
  ];
}
