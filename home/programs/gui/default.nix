{pkgs, ...}: {
  imports = [
    ./browsers.nix
    ./emulators.nix
    ./llvm.nix
    ./media.nix
    ./messaging.nix
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

    # utils
    wl-clipboard
    wl-screenrec
    wlr-randr
  ];

  programs.obs-studio = {
    enable = true;
    plugins = [pkgs.obs-studio-plugins.wlrobs];
  };
}
