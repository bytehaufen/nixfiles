{pkgs, ...}: {
  # Let it try to start a few more times
  systemd.user.services.waybar = {
    Unit.StartLimitBurst = 30;
  };

  programs = {
    waybar = {
      enable = true;
      package = pkgs.waybar.overrideAttrs (oa: {
        mesonFlags = (oa.mesonFlags or []) ++ ["-Dexperimental=true"];
      });
      systemd = {
        enable = true;
        target = "hyprland-session.target";
      };

      settings = {
        primary = {
          layer = "top";
          position = "top";
          mod = "dock";
          exclusive = true;
          passthrough = false;
          gtk-layer-shell = true;
          height = 24;
          spacing = 4;
          # modules-left = ["hyprland/workspaces" "hyprland/submap"];
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
          "hyprland/workspaces" = {
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
            format = "{:%a %d %b  <span></span> %H:%M}";
          };
          cpu = {
            format = "  {usage}%";
            states = {
              warning = 70;
              critical = 90;
            };
          };
          disk = {
            format = "  {percentage_free}%";
            states = {
              warning = 70;
              critical = 90;
            };
          };
          memory = {
            format = "<span>󰍛</span> {}%";
            states = {
              warning = 70;
              critical = 90;
            };
          };
          backlight = {
            format = "{icon} {percent}%";
            tooltip-format = "{percent}%";
            format-icons = [""];
          };
          "custom/keymap" = {
            format = "⌨ {}";
            exec = "hyprctl devices | rg -A 2 'at-translated-set-2-keyboard' | grep keymap | awk '{ print $3 }'";
            # TODO: Remove inline
            # exec = "${scripts.getKeymapLang}/bin/get_keymap_lang";
            interval = 2;
          };
          battery = {
            states = {
              warning = 30;
              critical = 15;
            };
            format = "{icon}   {capacity}%";
            # format-charging = "<span></span> {capacity}%";
            # format-charging= " 󰂄 {capacity}%";
            # format-plugged= " {capacity}%";
            # format-icons = ["" "" "" "" ""];
            format-icons = ["" "" "" "" ""];
          };
          network = {
            interval = 2;
            interface = "wlan0";
            format-wifi = "   {essid}";
            format-ethernet = " {ifname}";
            format-linked = " {ifname}";
            format-disconnected = "  ";
            tooltip-format = "{ifname}: {ipaddr}/{cidr}\n {bandwidthDownBits}\n {bandwidthUpBits}";
            on-click = "nmcli device wifi rescan && nm-connection-editor";
          };
          pulseaudio = {
            format = "<span>{icon}</span> {volume}%   {format_source}";
            format-bluetooth = "<span>{icon}</span> {volume}%   {format_source}";
            format-bluetooth-muted = "<span> {icon}</span>   {format_source}";
            format-muted = "<span></span>   {format_source}";
            format-source = "<span></span> {volume}%";
            format-source-muted = "<span></span>";
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
            format = "<span> </span>";
            format-icons = [""];
            on-click = "wlogout -p layer-shell";
          };
        };
      };
      style = ''
        #workspaces button {
          padding: 0 10px;
          margin: 0 6px;
          border-top: 3px solid;
          border-bottom: 3px solid transparent;
        }

        #workspaces button.active {
          border-top: 3px solid;
        }

        #workspaces button.urgent {
          border-bottom: 3px solid;
        }

        #battery.warning,
        #disk.warning,
        #memory.warning,
        #cpu.warning ,
        #custom-systemd,
        #battery.critical,
        #disk.critical,
        #memory.critical,
        #cpu.critical,
        #battery.charging,
        #custom-recording {
          border-bottom: 3px solid;
        }

        #custom-recording {
          padding: 0;
          margin: 0 6px;
        }

        #tray {
          margin-left: -1000000px;
        }

        #custom-logout {
          padding: 0 6px 0 0 ;
        }
        #custom-autosuspend {
          font-size: 20px;
        }
      '';
    };
  };
}
