{
  config,
  pkgs,
  ...
}: let
  defaultApplications = {
    # TODO: Extract this from ~/.config/mimeapps.list
  };
in {
  xdg = {
    enable = true;
    cacheHome = config.home.homeDirectory + "/.local/cache";

    mime.enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = defaultApplications;
    };

    systemDirs.data = ["${config.home.homeDirectory}/.nix-profile/share/applications" "${config.home.homeDirectory}/.nix-profile/share/"];

    userDirs = {
      enable = true;
      createDirectories = true;
      extraConfig = {
        XDG_SCREENSHOTS_DIR = "${config.xdg.userDirs.pictures}/Screenshots";
      };
    };
  };

  home.packages = [
    # used by `gio open` and xdg-gtk
    (pkgs.writeShellScriptBin "xdg-terminal-exec" ''
      kitty "$@"
    '')
    pkgs.xdg-utils
  ];
}
