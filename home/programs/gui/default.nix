{pkgs, ...}: {
  home.packages = with pkgs; [
    gnome-calculator # Calculator
    # TODO: Remove, replaced by pass
    keepassxc # Password manager
    mission-center # System monitor
    nautilus # File manager
    overskride # Bluetooth / Obex client
    vimiv-qt # Image viewer

    glibc
    xwayland
  ];
}
