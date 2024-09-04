{config, ...}: {
  programs.swaylock = {
    # FIXME: Need to take systems `swaylock`,
    # because home managers has no access to pam
    enable = true;
    settings = {
      show-failed-attempts = true;
      image = "${config.theme.wallpaper}";
      indicator-radius = 100;
      indicator-thickness = 7;
      effect-blur = "7x5";
      effect-vignette = "0.5:0.5";
      ring-color = "fe8019";
      key-hl-color = "fb4934";
      line-color = "00000000";
      inside-color = "28282866";
      separator-color = "00000000";
      fade-in = 0.2;
    };
  };
}
