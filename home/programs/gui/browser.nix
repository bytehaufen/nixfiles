{pkgs, ...}: {
  programs = {
    firefox.enable = true;

    # Brave
    chromium = {
      enable = true;
      package = pkgs.brave;
      commandLineArgs = [
        "--enable-features=UseOzonePlatform"
        "--ozone-platform=wayland"
        "--password-store=basic"
      ];
    };
  };
}
