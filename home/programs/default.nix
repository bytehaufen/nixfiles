{pkgs, ...}: {
  imports = [
    ./anyrun

    # FIXME: Merge with systemconfig
    # ./browsers/qutebrowser.nix

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
    nautilus
  ];
}
