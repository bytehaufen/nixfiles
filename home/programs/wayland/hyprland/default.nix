{
  pkgs,
  config,
  ...
}: let
  nixGL = import ../../../wrapper/nixGL.nix {inherit pkgs config;};
in {
  imports = [
    ./binds.nix
  ];

  home.packages = with pkgs; [
    brillo # Brightness control
    hyprshot
    wlr-randr
    wl-clipboard
    brightnessctl
    xwayland
    xdg-desktop-portal-gtk
    wlroots
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
