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
        "--password-store=gnome-libsecret"
        "--ozone-platform-hint=auto"
        "--ozone-platform=wayland"
        "--gtk-version=4"
        "--enable-wayland-ime"
        "--enable-features=WebRTCPipeWireCapturer"
      ];
    };
  };
}
