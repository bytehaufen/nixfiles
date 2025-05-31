{pkgs, ...}: {
  imports = [
    ./browser.nix
    ./emulator.nix
    ./gammastep.nix
    ./kitty.nix
    ./llvm.nix
    ./media.nix
    ./messaging.nix
    ./obs.nix
    ./office.nix
  ];

  home.packages = with pkgs; [
    gnome-calculator # Calculator
    keepassxc # Password manager
    mission-center # System monitor
    nautilus # File manager
    overskride # Bluetooth / Obex client
    vimiv-qt # Image viewer

    # Screenshot
    grim
    grimblast
    slurp

    # Utilities
    wl-clipboard
    wl-screenrec
    wlr-randr
  ];
}
