{pkgs, ...}: {
  home.packages = with pkgs; [
    quickemu # Emulator manager
    quickgui # Emulator manager GUI
    spice-gtk # Spice client for quickemu

    wineWowPackages.waylandFull # Windows compatibility layer
    winetricks # Windows compatibility layer
  ];
}
