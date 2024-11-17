{
  config,
  inputs,
  pkgs,
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
    gnome-control-center
    mission-center
    overskride
    morewaita-icon-theme
    adwaita-icon-theme
    qogir-icon-theme
    hicolor-icon-theme
    pavucontrol
  ];

  dependencies = requiredDeps ++ guiDeps;
in {
  home.packages = dependencies;
  imports = [inputs.ags.homeManagerModules.default];
  programs.ags = {
    enable = true;
    configDir = ./ags;
    extraPackages = with pkgs;
      lib.attrValues inputs.ags.packages.${pkgs.system}
      ++ [
        fzf
      ];
    systemd.enable = true;
  };
}
