{pkgs, ...}: {
  imports = [
    # TODO: Customize
    ./mpv.nix
  ];

  home.packages = with pkgs; [
    pulsemixer # PulseAudio mixer
    pwvucontrol # PipeWire volume control
    spotube # Spotify client
    musicpod # YT Music client
  ];
}
