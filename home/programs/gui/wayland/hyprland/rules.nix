{lib, ...}: {
  wayland.windowManager.hyprland.settings = {
    # Layer rules
    layerrule = let
      toRegex = list: let
        elements = lib.concatStringsSep "|" list;
      in "^(${elements})$";

      lowopacity = [
        "bar"
        "calendar"
        "notifications"
        "system-menu"
      ];

      highopacity = [
        "anyrun"
        "osd"
        "logout_dialog"
      ];

      blurred = lib.concatLists [
        lowopacity
        highopacity
      ];
    in [
      "blur, ${toRegex blurred}"
      "xray 1, ${toRegex ["bar"]}"
      "ignorealpha 0.5, ${toRegex (highopacity ++ ["music"])}"
      "ignorealpha 0.2, ${toRegex lowopacity}"
    ];

    # Window rules
    windowrulev2 = [
      # Gnome calculator
      "float, class:^(org.gnome.Calculator)$"

      # Quickgui (Quickemu)
      "float, class:^(quickgui)$"
      "move 100%-w-20, class:^(quickgui)$"

      # Neovide
      "float, class:^(neovide)$"
      "size 80% 80%, class:^(neovide)$"

      # Allow tearing in games
      "immediate, class:^(osu\!|cs2)$"

      # Make Firefox PiP window floating and sticky
      "float, title:^(Picture-in-Picture)$"
      "pin, title:^(Picture-in-Picture)$"

      # Throw sharing indicators away
      "workspace special silent, title:^(Firefox — Sharing Indicator)$"
      "workspace special silent, title:^(.*is sharing (your screen|a window)\.)$"

      # Idle inhibit while watching videos
      "idleinhibit focus, class:^(mpv|.+exe|celluloid)$"
      "idleinhibit focus, class:^(brave)$, title:^(.*YouTube.*)$"
      "idleinhibit fullscreen, class:^(brave)$"
      "idleinhibit focus, class:^(firefox)$, title:^(.*YouTube.*)$"
      "idleinhibit fullscreen, class:^(firefox)$"
      "idleinhibit focus, class:^(qutebrowser)$, title:^(.*YouTube.*)$"
      "idleinhibit fullscreen, class:^(qutebrowser)$"

      # Spotube
      "float, class:^(spotube)$"
      "size 300 700, class:^(spotube)$"
      "monitor 0, class:^(spotube)$"
      "move 100%-w-20, class:^(spotube)$"

      # Musicpod
      "float, class:^(musicpod)$"
      "size 500 700, class:^(musicpod)$"
      "monitor 0, class:^(musicpod)$"
      "move 100%-w-20, class:^(musicpod)$"

      # Gpt4all
      "float, class:^(io.gpt4all.)$"
      "size 1280 720, class:^(io.gpt4all.)$"
      "move 100%-w-20, class:^(io.gpt4all.)$"

      "dimaround, class:^(gcr-prompter)$"
      "dimaround, class:^(xdg-desktop-portal-gtk)$"
      "dimaround, class:^(polkit-gnome-authentication-agent-1)$"

      # Fix xwayland apps
      "rounding 0, xwayland:1"
      "center, class:^(.*jetbrains.*)$, title:^(Confirm Exit|Open Project|win424|win201|splash)$"
      "size 640 400, class:^(.*jetbrains.*)$, title:^(splash)$"
    ];
  };
}
