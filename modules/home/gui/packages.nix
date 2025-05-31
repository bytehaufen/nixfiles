{
  pkgs,
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.opts.gui.enable {
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
  };
}
