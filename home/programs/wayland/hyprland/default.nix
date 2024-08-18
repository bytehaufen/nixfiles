{
  pkgs,
  config,
  ...
}: let
  nixGL = import ../../../wrapper/nixGL.nix {inherit pkgs config;};
in {
  # imports = [../waybar];
  imports = [./settings.nix];
  home.packages = with pkgs; [
    hyprshot
    wlr-randr
    wl-clipboard
    brightnessctl
    xwayland
    xdg-desktop-portal-gtk
    wlroots
    wlogout
    qt5ct
    libva
    dconf
    wayland-utils
    wayland-protocols
    meson
    swaybg
    xdg-desktop-portal-hyprland
  ];

  # # TODO: Move to parent
  home.sessionVariables = {
    GTK_USE_PORTAL = 1;
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
  };

  wayland.windowManager.hyprland = {
    enable = true;
    package = nixGL pkgs.hyprland;
    systemd = {
      enable = true;
      variables = ["--all"];
      extraCommands = [
        "systemctl --user stop graphical-session.target"
        "systemctl --user start hyprland-session.target"
      ];
    };
    plugins = with pkgs; [
      hyprlandPlugins.hyprexpo # Hyprland workspaces overview plugin
      hyprlandPlugins.hyprbars # Hyprland window title plugin
    ];

    xwayland.enable = true;

    # TODO: Split into separate files

    settings = {
      env = [
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
      ];
      exec-once = [
        "swaybg -m fill -i ${config.stylix.image}"
        "dbus-update-activation-environment --systemd XDG_CURRENT_DESKTOP WAYLAND_DISPLAY"
      ];

      bind = [
        # Switch keyboard lang
        "SUPER, backspace, exec, switch_lang.sh"

        # Terminal
        "SUPER,      Return,                exec, kitty"
        "SUPERSHIFT, Return,                exec, kitty -e /bin/bash"

        # Keybinding to apply monitor settings
        "SUPERSHIFT, M, exec,    set_monitors.sh"
        "SUPERCTRL,  M, exec,    set_monitors_mirrored.sh"

        # Swaps the two halves of the split of the current window.
        "SUPER,      A, layoutmsg, togglesplit"
        "SUPERSHIFT, A, layoutmsg, swapsplit"

        "SUPER, Q, killactive,"
        "SUPERSHIFT, Q, exit,"
        "SUPER, D, exec, wofi --show drun"
        "SUPER, W, exec, qutebrowser"
        "SUPER, E, exec, nautilus"
        "SUPER, V, togglefloating, active"

        # Movement
        "SUPER, h, movefocus, l"
        "SUPER, l, movefocus, r"
        "SUPER, k, movefocus, u"
        "SUPER, j, movefocus, d"

        # TODO: Simplify
        # Switch workspaces with SUPER + [0-9]
        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER, 6, workspace, 6"
        "SUPER, 7, workspace, 7"
        "SUPER, 8, workspace, 8"
        "SUPER, 9, workspace, 9"
        "SUPER, 0, workspace, 10"

        # # Move active window to a workspace with SUPER + $shift + [0-9]
        "SUPERSHIFT, 1, movetoworkspace, 1"
        "SUPERSHIFT, 2, movetoworkspace, 2"
        "SUPERSHIFT, 3, movetoworkspace, 3"
        "SUPERSHIFT, 4, movetoworkspace, 4"
        "SUPERSHIFT, 5, movetoworkspace, 5"
        "SUPERSHIFT, 6, movetoworkspace, 6"
        "SUPERSHIFT, 7, movetoworkspace, 7"
        "SUPERSHIFT, 8, movetoworkspace, 8"
        "SUPERSHIFT, 9, movetoworkspace, 9"
        "SUPERSHIFT, 0, movetoworkspace, 10"

        # Move focused window
        "SUPERSHIFT, h, movewindow, l"
        "SUPERSHIFT, j, movewindow, d"
        "SUPERSHIFT, k, movewindow, u"
        "SUPERSHIFT, l, movewindow, r"

        "SUPERCTRL, h, resizeactive, -40 0"
        "SUPERCTRL, l, resizeactive, 40 0"
        "SUPERCTRL, k, resizeactive, 0 -40"
        "SUPERCTRL, j, resizeactive, 0 40"

        # Scroll through existing workspaces with SUPER + scroll
        "SUPER, mouse_down, workspace, e+1"
        "SUPER, mouse_up, workspace, e-1"

        # Enter fullscreen mode
        "SUPER, m, fullscreen, toggle"

        # Go to next window, for example to reach a floating one
        "SUPER, space, cyclenext"

        ", XF86AudioRaiseVolume,      exec, pactl set-sink-volume @DEFAULT_SINK@ +5% && pactl set-sink-mute @DEFAULT_SINK@ 0"
        ", XF86AudioLowerVolume,      exec, pactl set-sink-volume @DEFAULT_SINK@ -5%"
        ", XF86AudioMute,             exec, pactl set-sink-mute @DEFAULT_SINK@ toggle"
        ", XF86MonBrightnessDown,     exec, brightnessctl set 5%-"
        ", XF86MonBrightnessUp,       exec, brightnessctl set +5%"

        # FIXME -> Does not work -> key not recognized
        ", XF86AudioMicMute,          exec, pactl set-source-mute @DEFAULT_SOURCE@ toggle"
        # FIXME -> Does not work -> Power button forces shutdown
        ", XF86PowerOff,              exec, systemctl suspend"

        # Custom scripts
        "SUPER ALT, l,                exec, suspend.sh"
        "SUPER ALT, R,                exec, record-area"
        "SUPER ALT, S,                exec, screenshot-area"
      ];

      bindm = [
        # Move/resize windows with SUPER + LMB/RMB and dragging
        "SUPER, mouse:272, movewindow"
        "SUPER SHIFT, mouse:272, resizewindow"
      ];

      input = {
        # Custom keyboard layout defined in ~/.config/xkb/symbols/
        kb_layout = "en-65,de-65";
        kb_options = "caps:escape";

        numlock_by_default = true;
        repeat_delay = 300;
        repeat_rate = 60;
        follow_mouse = true;
        float_switch_override_focus = 0;

        touchpad = {
          natural_scroll = true;
        };
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
        workspace_swipe_min_speed_to_force = 5;
        workspace_swipe_cancel_ratio = 0.3;

        workspace_swipe_distance = 1200;
        workspace_swipe_create_new = true;
      };

      general = {
        border_size = 2;

        gaps_in = 4;
        gaps_out = 8;

        layout = "dwindle";
      };

      decoration = {
        rounding = 17;

        blur = {
          enabled = true;
          size = 2;
          passes = 2;
          new_optimizations = true;
          ignore_opacity = false;
        };

        dim_inactive = false;
        dim_strength = 0.1;
        dim_special = 0;

        drop_shadow = false;
        shadow_range = 30;
        shadow_render_power = 3;
        # col.shadow = "rgba(01010166)";
      };
      misc = {
        vfr = 1;
        vrr = 0;
        focus_on_activate = true;
        animate_manual_resizes = true;
        animate_mouse_windowdragging = true;
        enable_swallow = true;
        disable_hyprland_logo = true;
      };

      dwindle = {
        preserve_split = true;
      };

      windowrule = [
        "float,title:^(Open File)(.*)$"
        "float,title:^(Open Folder)(.*)$"
        "float,title:^(Save As)(.*)$"
        "float,title:^(Library)(.*)$ "
      ];

      windowrulev2 = [
        "float, class:^wofi"
        "size 60% 70%, class:^wofi"
        "size 50% 20%, class:^wofi-(browser|emoji)$"
        "center, class:^wofi"
        "float, class:^pavucontrol"
        "size 60% 70%, class:^pavucontrol"
        "center, class:^pavucontrol"
        "rounding 10, floating:1"
        "workspace 1, class:^org.qutebrowser.qutebrowser$"
      ];

      layerrule = [
        "blur, gtk-layer-shell"
        "ignorezero, gtk-layer-shell"
        "blur, waybar"
        "ignorezero, waybar"
      ];

      # TODO: Add plugins
      # plugin = {
      #   hyprbars = {
      #     bar_color = "rgba(090727FF)";
      #     bar_height = 20;
      #     bar_text_size = 10;
      #     bar_text_color = "rgba(7775D0FF)";
      #   };
      #   borders-plus-plus = {
      #     add_borders = 2;
      #     col.border_1 = "rgb(82E6F5)";
      #     col.border_2 = "rgb(2222ff)";
      #   };
      # };
    };
  };
}
