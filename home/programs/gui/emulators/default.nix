{pkgs, ...}: {
  home.packages = with pkgs; [
    # NOTE: Stable because currently broken
    stable.quickemu # Emulator manager
    stable.quickgui # Emulator manager GUI
    spice-gtk # Spice client for quickemu

    wineWowPackages.waylandFull # Windows compatibility layer
    winetricks # Windows compatibility layer
  ];
}
