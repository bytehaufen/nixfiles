{...}: {
  wayland.windowManager.hyprland.settings = {
    env = [
      "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
    ];

    exec-once = [
      # FIXME: Need to configure
      # "hyprlock"
      # TODO: Check needed
      # "dbus-update-activation-environment --systemd XDG_CURRENT_DESKTOP WAYLAND_DISPLAY"
    ];

    general = {
      gaps_in = 5;
      gaps_out = 5;
      border_size = 1;

      allow_tearing = true;
      resize_on_border = true;

      layout = "dwindle";
    };

    decoration = {
      rounding = 16;
      blur = {
        enabled = true;
        brightness = 1.0;
        contrast = 1.0;
        noise = 0.01;

        vibrancy = 0.2;
        vibrancy_darkness = 0.5;

        passes = 4;
        size = 7;

        popups = true;
        popups_ignorealpha = 0.2;

        new_optimizations = true;
      };

      drop_shadow = true;
      shadow_ignore_window = true;
      shadow_offset = "0 15";
      shadow_range = 100;
      shadow_render_power = 2;
      shadow_scale = 0.97;
    };

    animations = {
      enabled = true;
      animation = [
        "border, 1, 2, default"
        "fade, 1, 4, default"
        "windows, 1, 3, default, popin 80%"
        "workspaces, 1, 2, default, slide"
      ];
    };

    input = {
      #FIXME: Need to move to nix conf
      # Custom keyboard layout defined in ~/.config/xkb/symbols/
      kb_layout = "en-65,de-65";
      kb_options = "caps:escape";

      numlock_by_default = true;
      repeat_delay = 300;
      repeat_rate = 60;
      follow_mouse = true;
      float_switch_override_focus = 0;

      accel_profile = "flat";
      touchpad = {
        natural_scroll = true;
        scroll_factor = 0.1;
      };
    };

    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };

    misc = {
      # disable auto polling for config file changes
      disable_autoreload = true;

      force_default_wallpaper = 0;

      # disable dragging animation
      animate_mouse_windowdragging = false;

      # enable variable refresh rate (effective depending on hardware)
      vfr = 1;
      vrr = 0;
    };

    # touchpad gestures
    gestures = {
      workspace_swipe = true;
      workspace_swipe_forever = true;
      workspace_swipe_fingers = 3;
      workspace_swipe_cancel_ratio = 0.3;
      workspace_swipe_distance = 1200;
      workspace_swipe_create_new = true;
    };

    xwayland.force_zero_scaling = true;

    debug.disable_logs = false;
  };
}