{pkgs, ...}: {
  imports = [
    ./hyprland
    ./swaylock.nix
    ./scripts

    # FIXME: Configure
    # ./hyprlock.nix
  ];

  home.packages = with pkgs; [
    # Screenshot
    grim
    grimblast
    slurp

    # utils
    wl-clipboard
    stable.wl-screenrec
    wlr-randr

    libvdpau-va-gl
    vpl-gpu-rt
    intel-media-driver
    intel-compute-runtime
    v4l-utils
    ffmpeg
    libcamera
  ];

  programs.obs-studio = {
    enable = true;
    plugins = [pkgs.obs-studio-plugins.wlrobs];
  };
}
