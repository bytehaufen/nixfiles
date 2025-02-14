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
    spice-gtk # Spice client for quickemu

    wineWowPackages.waylandFull # Windows compatibility layer
    winetricks # Windows compatibility layer
    distrobox
  ];

  xdg.configFile."distrobox/distrobox.conf".text = ''
    container_additional_volumes="/nix/store:/nix/store:ro /etc/static/profiles/per-user:/etc/profiles/per-user:ro"
  '';
}
