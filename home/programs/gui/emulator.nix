{
  pkgs,
  config,
  ...
}: let
  data = config.xdg.dataHome;
in {
  home.sessionVariables = {
    WINEPREFIX = "${data}/wine";
  };

  home.packages = with pkgs; [
    # NOTE: Stable because currently broken
    quickemu # Emulator manager
    stable.quickgui # Emulator manager GUI
    spice-gtk # Spice client for quickemu

    wineWowPackages.waylandFull # Windows compatibility layer
    winetricks # Windows compatibility layer
  ];
}
