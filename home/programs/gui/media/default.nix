{
  pkgs,
  config,
  ...
}: {
  imports = [
    # TODO: Customize
    ./mpv.nix
  ];

  home.packages = with pkgs; [
    pulsemixer # PulseAudio mixer
    pwvucontrol # PipeWire volume control
    (config.lib.nixGL.wrap spotube) # Spotify client
    (config.lib.nixGL.wrap musicpod) # YT Music client
  ];
}
