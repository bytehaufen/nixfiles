{
  pkgs,
  config,
  lib,
  ...
}: {
  options.opts.programs.obs.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable OBS Studio configuration.";
  };

  config = lib.mkIf (config.opts.gui.enable && config.opts.programs.obs.enable) {
    programs.obs-studio = {
      enable = true;
      package = pkgs.stable.obs-studio;
      plugins = with pkgs.stable.obs-studio-plugins; [
        # Screen capture
        wlrobs
        obs-vaapi
        obs-nvfbc
        obs-teleport
        droidcam-obs
        obs-vkcapture
        obs-gstreamer
        obs-3d-effect
        input-overlay
        obs-multi-rtmp
        obs-source-clone
        obs-shaderfilter
        obs-source-record
        obs-livesplit-one
        looking-glass-obs
        obs-vintage-filter
        obs-command-source
        obs-move-transition
        obs-backgroundremoval
        obs-pipewire-audio-capture
      ];
    };
  };
}
