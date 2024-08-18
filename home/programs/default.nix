{pkgs, ...}: {
  imports = [
    ./anyrun
    ./browsers/qutebrowser.nix
    ./media
    ./office

    ./gtk.nix
    ./qt.nix
  ];

  home.packages = with pkgs; [
    gnome-calculator
    gnome.gnome-control-center

    overskride # Bluetooth / Obex client
    mission-center # System monitor
  ];
}
