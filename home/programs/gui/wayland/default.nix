{pkgs, ...}: {
  imports = [
    ./hyprland
    ./swaylock.nix

    # FIXME: Configure
    # ./hyprlock.nix
  ];

  home.packages = with pkgs; [
    # Screenshot
    grim
    slurp

    # utils
    wl-clipboard
    wl-screenrec
    wlr-randr
  ];
}
