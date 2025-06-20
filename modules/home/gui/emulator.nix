{
  pkgs,
  config,
  lib,
  ...
}: let
  data = config.xdg.dataHome;
in {
  config = lib.mkIf config.opts.home.gui.enable {
    home.sessionVariables = {
      WINEPREFIX = "${data}/wine";
    };

    home.packages = with pkgs.stable; [
      # Upstream mostly broken
      pkgs.stable.quickemu # Emulator manager
      pkgs.stable.quickgui # Quickemu frontend
      spice-gtk # Spice client for quickemu

      wineWowPackages.waylandFull # Windows compatibility layer
      winetricks # Windows compatibility layer
      distrobox
    ];

    xdg.configFile."distrobox/distrobox.conf".text = ''
      container_additional_volumes="/nix/store:/nix/store:ro /etc/static/profiles/per-user:/etc/profiles/per-user:ro"
    '';
  };
}
