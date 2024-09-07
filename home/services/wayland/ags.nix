{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: let
  requiredDeps = with pkgs; [
    config.wayland.windowManager.hyprland.package
    bash
    brightnessctl
    bun
    coreutils
    curl
    dart-sass
    fd
    gawk
    imagemagick
    inotify-tools
    procps
    ripgrep
    swww
    util-linux
    which
    networkmanager
  ];

  guiDeps = with pkgs; [
    gnome.gnome-control-center
    mission-center
    overskride
    morewaita-icon-theme
    adwaita-icon-theme
    qogir-icon-theme
    hicolor-icon-theme
    pavucontrol
  ];

  dependencies = requiredDeps ++ guiDeps;

  cfg = config.programs.ags;
in {
  imports = [
    inputs.ags.homeManagerModules.default
  ];
  home.packages = dependencies;

  programs.ags = {
    enable = true;
    configDir = ../../../ags;
    extraPackages = with pkgs; [
      accountsservice
      adwaita-icon-theme
      qogir-icon-theme
      hicolor-icon-theme
    ];
  };

  systemd.user.services.ags = {
    Unit = {
      Description = "Aylur's Gtk Shell";
      PartOf = [
        "tray.target"
        "graphical-session.target"
      ];
    };
    Service = {
      Environment = "PATH=/run/wrappers/bin:${lib.makeBinPath dependencies}";
      ExecStart = "${cfg.package}/bin/ags";
      Restart = "on-failure";
    };
    Install.WantedBy = ["graphical-session.target"];
  };
}
