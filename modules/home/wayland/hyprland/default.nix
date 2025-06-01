{
  pkgs,
  config,
  lib,
  ...
} @ args: let
  # Custom scripts, used in keybindings and in user environment
  scripts = import ./scripts.nix args;

  # Hyprland settings consist of a set of keybindings and other configurations
  settings = lib.mkMerge [
    (import ./settings.nix args)
    (import ./binds.nix (args // {inherit scripts;}))
    (import ./rules.nix args)
  ];
in {
  # Propagate all scripts to the user env to make them available in the shell
  home.packages = [pkgs.swaybg] ++ builtins.attrValues scripts;

  programs.zsh.shellAliases = {
    xkill = "${lib.getExe' config.wayland.windowManager.hyprland.package "hyprctl"} kill";
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-wlr
    ];

    config = {
      common = {
        default = [
          "gtk"
        ];
        "org.freedesktop.impl.portal.Secret" = [
          "gnome-keyring"
        ];
      };
      hyprland.default = ["gtk" "wlr"];
    };
  };

  wayland.windowManager.hyprland = {
    inherit settings;

    package = config.lib.nixGL.wrap (pkgs.hyprland.override {wrapRuntimeDeps = false;});
    enable = true;

    systemd = {
      enable = true;
      variables = ["--all"];
    };

    xwayland.enable = true;
  };

  home.file.".wayland-session" = {
    source = "${lib.getExe pkgs.hyprland}";
    executable = true;
  };
}
