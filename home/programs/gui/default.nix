{pkgs, ...}: {
  imports = [../gui/social];

  home.packages = with pkgs; [
    gnome-calculator # Calculator
    # TODO: Remove, replaced by pass
    keepassxc # Password manager
    mission-center # System monitor
    nautilus # File manager
    overskride # Bluetooth / Obex client
    vimiv-qt # Image viewer

    # Screenshot
    grim
    grimblast
    slurp

    # utils
    wl-clipboard
    stable.wl-screenrec
    wlr-randr
  ];

  programs.obs-studio = {
    enable = true;
    plugins = [pkgs.obs-studio-plugins.wlrobs];
  };
}
