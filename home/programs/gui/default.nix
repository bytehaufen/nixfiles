{pkgs, ...}: {
  imports = [
    ./gtk.nix
    ./qt.nix
  ];

  home.packages = with pkgs; [
    gnome-calculator # Calculator
    keepassxc # Password manager
    mission-center # System monitor
    nautilus # File manager
    overskride # Bluetooth / Obex client
  ];
}
