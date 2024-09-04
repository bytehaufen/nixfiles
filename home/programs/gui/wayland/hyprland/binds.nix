{lib, ...}: let
  # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
  workspaces = builtins.concatLists (builtins.genList (
      x: let
        ws = let
          c = (x + 1) / 10;
        in
          builtins.toString (x + 1 - (c * 10));
      in [
        "$mod, ${ws}, workspace, ${toString (x + 1)}"
        "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
      ]
    )
    10);

  toggle = program: service: let
    prog = builtins.substring 0 14 program;
    runserv = lib.optionalString service "run-as-service";
  in "pkill ${prog} || ${runserv} ${program}";
in {
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    # mouse movements
    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
      "$mod SHIFT, mouse:272, resizewindow"
    ];

    # binds
    bind = let
      monocle = "dwindle:no_gaps_when_only";
    in
      [
        # Compositor commands
        "$mod SHIFT, Q, exec, pkill Hyprland"
        "$mod SHIFT, Q, exit,"
        "$mod, Q, killactive,"
        "$mod, F, fullscreen,"
        "$mod, G, togglegroup,"
        "$mod SHIFT, N, changegroupactive, f"
        "$mod SHIFT, P, changegroupactive, b"
        "$mod, V, togglefloating, active"
        "$mod, P, pseudo,"
        "$mod ALT, ,resizeactive,"
        "$mod,      A, layoutmsg, togglesplit"
        "$mod SHIFT, A, layoutmsg, swapsplit"

        # Toggle "monocle" (no_gaps_when_only)
        "$mod, M, exec, hyprctl keyword ${monocle} $(($(hyprctl getoption ${monocle} -j | jaq -r '.int') ^ 1))"
        # "$mod, m, fullscreen, toggle" # NOTE: Eventually set this to another binding

        # Keybinding to apply monitor settings
        "$mod SHIFT, M, exec,    set_monitors.sh"
        "$mod CTRL,  M, exec,    set_monitors_mirrored.sh"

        # Utility
        # Terminal
        "$mod, Return, exec, run-as-service kitty"
        "$mod SHIFT, Return, exec, run-as-service kitty -e /bin/bash"
        # FIXME: Check necessity
        # "SUPER,      Return,                exec, kitty"
        # "SUPERSHIFT, Return,                exec, kitty -e /bin/bash"

        # Gui
        "$mod, W, exec, qutebrowser"
        "$mod, E, exec, nautilus"

        # Switch keyboard lang
        "SUPER, backspace, exec, switch_lang.sh"

        # Logout menu
        "$mod, Escape, exec, ${toggle "wlogout" true} -p layer-shell"

        # Standby screen #FIXME: Repair
        # "$mod ALT, L, exec, pgrep hyprlock || hyprlock"
        "$mod ALT, l, exec, suspend.sh"

        # Open calculator
        ", XF86Calculator, exec, ${toggle "gnome-calculator" true}"
        # Open settings
        "$mod, U, exec, XDG_CURRENT_DESKTOP=gnome gnome-control-center"

        # Movement
        "$mod, h, movefocus, l"
        "$mod, l, movefocus, r"
        "$mod, k, movefocus, u"
        "$mod, j, movefocus, d"
        # Move focused window
        "$mod SHIFT, h, movewindow, l"
        "$mod SHIFT, j, movewindow, d"
        "$mod SHIFT, k, movewindow, u"
        "$mod SHIFT, l, movewindow, r"
        # Resize
        "$mod CTRL, h, resizeactive, -40 0"
        "$mod CTRL, l, resizeactive, 40 0"
        "$mod CTRL, k, resizeactive, 0 -40"
        "$mod CTRL, j, resizeactive, 0 40"

        # Go to next window, for example to reach a floating one
        "$mod, space, cyclenext"

        # Special workspace
        "$mod SHIFT, grave, movetoworkspace, special"
        "$mod, grave, togglespecialworkspace, eDP-1"

        # Cycle workspaces
        "$mod, bracketleft, workspace, m-1"
        "$mod, bracketright, workspace, m+1"

        # Cycle monitors
        "$mod SHIFT, bracketleft, focusmonitor, l"
        "$mod SHIFT, bracketright, focusmonitor, r"

        # Send focused workspace to left/right monitors
        "$mod SHIFT ALT, bracketleft, movecurrentworkspacetomonitor, l"
        "$mod SHIFT ALT, bracketright, movecurrentworkspacetomonitor, r"

        # Screen[shot|record]
        "$mod ALT, R,                exec, record-area"
        "$mod ALT, S,                exec, screenshot-area"
      ]
      ++ workspaces;

    bindr = [
      # Launcher
      "$mod, SUPER_L, exec, ${toggle "anyrun" true}"
    ];

    bindl = [
      # Media controls
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPrev, exec, playerctl previous"
      ", XF86AudioNext, exec, playerctl next"

      # Volume
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
    ];

    bindle = [
      # Volume
      ", XF86AudioRaiseVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 6%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 6%-"

      # Backlight
      ", XF86MonBrightnessUp, exec, brillo -q -u 300000 -A 5"
      ", XF86MonBrightnessDown, exec, brillo -q -u 300000 -U 5"
    ];
  };
}
