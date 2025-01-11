{pkgs, ...}: {
  imports = [
    ./browser.nix
    ./emulator.nix
    ./gammastep.nix
    ./llvm.nix
    ./media.nix
    ./messaging.nix
    ./office.nix
    ./terminal.nix
  ];

  home.packages = with pkgs; [
    gnome-calculator # Calculator
    keepassxc # Password manager
    mission-center # System monitor
    nautilus # File manager
    overskride # Bluetooth / Obex client
    vimiv-qt # Image viewer

    # Screenshot
    grim
    grimblast
    slurp

    # utils
    wl-clipboard
    wl-screenrec
    wlr-randr
  ];

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
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
}
