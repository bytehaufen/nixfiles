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
    obs-studio

    # utils
    wl-clipboard
    stable.wl-screenrec
    wlr-randr
  ];
}
