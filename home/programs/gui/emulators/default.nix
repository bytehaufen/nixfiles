{
  pkgs,
  pkgs-stable,
  ...
}: {
  home.packages = [
    # NOTE: Stable because currently broken
    pkgs-stable.quickemu # Emulator manager
    pkgs-stable.quickgui # Emulator manager GUI
    pkgs.spice-gtk # Spice client for quickemu

    pkgs.wineWowPackages.waylandFull # Windows compatibility layer
    pkgs.winetricks # Windows compatibility layer
  ];
}
