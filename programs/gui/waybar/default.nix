{pkgs, ...}: let
  # scripts = import ./scripts;
in {
  programs = {
    waybar = {
      enable = true;
      # systemd = {
      # enable = false;
      # target = "hyprland-session.target";
      # };

      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          mod = "dock";
          exclusive = true;
          passthrough = false;
          gtk-layer-shell = true;
          height = 0;
          modules-left = ["hyprland/workspaces" "hyprland/submap"];
          modules-right = [
            "custom/progress"
            "custom/systemd"
            "custom/recording"
            "pulseaudio"
            "bluetooth"
            "network"
            "cpu"
            "memory"
            "disk"
            "backlight"
            "custom/keymap"
            "battery"
            "custom/autosuspend"
            "clock"
            "custom/logout"
          ];
          "wlr/workspaces" = {
            sort-by-number = true;
            format = "{icon}";
            on-click = "activate";
          };
          "custom/progress" = {
            exec = "waybar-progress";
            return-type = "json";
            interval = 1;
          };
          "custom/systemd" = {
            exec = "waybar-systemd";
            return-type = "json";
            interval = 10;
          };
          "custom/recording" = {
            exec = "waybar-recording";
            return-type = "json";
            signal = 3;
            interval = "once";
            on-click = "record-area";
          };
          clock = {
            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
            format = "<span foreground='#928374'></span> {:%a %d %b  <span foreground='#928374'></span> %H:%M}";
          };
          cpu = {
            format = "<span foreground='#928374'></span> {usage}%";
            states = {
              warning = 70;
              critical = 90;
            };
          };
          disk = {
            format = "<span foreground='#928374'></span> {percentage_free}%";
            states = {
              warning = 70;
              critical = 90;
            };
          };
          memory = {
            format = "<span foreground='#928374'>󰍛</span> {}%";
            states = {
              warning = 70;
              critical = 90;
            };
          };
          backlight = {
            format = "<span foreground='#928374'>{icon}</span> {percent}%";
            format-icons = [""];
          };
          "custom/keymap" = {
            format = "<span foreground='#928374'>⌨</span> {}";
            exec = "hyprctl devices | rg -A 2 'at-translated-set-2-keyboard' | grep keymap | awk '{ print $3 }'";
            # TODO: Remove inline
            # exec = "${scripts.getKeymapLang}/bin/get_keymap_lang";
            interval = 1;
          };
          battery = {
            states = {
              warning = 30;
              critical = 15;
            };
            format = "<span foreground='#928374'>{icon}</span> {capacity}%";
            format-charging = "<span foreground='#928374'></span> {capacity}%";
            format-icons = ["" "" "" "" ""];
          };
          network = {
            interval = 2;
            interface = "wlan0";
            format-wifi = "<span foreground='#928374'></span> {essid}";
            format-ethernet = "<span foreground='#928374'></span> {ifname}";
            format-linked = "<span foreground='#928374'></span> {ifname}";
            format-disconnected = " <span foreground='#928374'></span> ";
            tooltip-format = "{ifname}: {ipaddr}/{cidr}\n {bandwidthDownBits}\n {bandwidthUpBits}";
            on-click = "nmcli device wifi rescan && nm-connection-editor";
          };
          pulseaudio = {
            format = "<span foreground='#928374'>{icon}</span> {volume}%   {format_source}";
            format-bluetooth = "<span foreground='#928374'>{icon}</span> {volume}%   {format_source}";
            format-bluetooth-muted = "<span foreground='#928374'> {icon}</span>   {format_source}";
            format-muted = "<span foreground='#928374'></span>   {format_source}";
            format-source = "<span foreground='#928374'></span> {volume}%";
            format-source-muted = "<span foreground='#928374'></span>";
            format-icons = {
              headphone = "";
              hands-free = "";
              headset = "";
              phone = "";
              portable = "";
              car = "";
              default = ["" "" ""];
            };
            on-click = "pavucontrol";
            on-click-right = "env LIBGL_ALWAYS_SOFTWARE=1 helvum";
          };
          bluetooth = {
            format = " {status}";
            format-connected = " {device_alias}";
            format-connected-battery = " {device_alias} {device_battery_percentage}%";
            format-device-preference = ["device1" "device2"];
            tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
            tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
            tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
            tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
            on-click = "toggle_bluetooth.sh";
            on-click-right = "blueman-manager";
          };
          tray = {
            icon-size = "21";
            spacing = "10";
          };
          "custom/autosuspend" = {
            format = "{}";
            # TODO:
            # exec = "${pkgs.getSuspendStatus}/bin/get_suspend_status.sh";
            exec = "if pgrep swayidle >/dev/null 2>&1; then echo 󰒲; else echo 󰒳; fi";
            interval = 1;
            on-click = "auto_suspend.sh";
          };
          "custom/logout" = {
            format = "<span foreground='#928374'>⏻ </span>";
            format-icons = [""];
            on-click = "wlogout -p layer-shell";
          };
        };
      };
    };
  };
}
