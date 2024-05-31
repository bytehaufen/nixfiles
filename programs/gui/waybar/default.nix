#FIXME: Move scripts and style out of here
{pkgs, ...}: let
  # scripts = import ./scripts;
in {
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
            tooltip-format = "{percent}%";
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
      style = ''
        @define-color background #1d2021;
        @define-color foreground #ebdbb2;
        @define-color dim        #928374;
        @define-color yellow     #fabd2f;
        @define-color red        #fb4934;
        @define-color green      #b8bb26;

        * {
          background: @background;
          /* background: transparent; */
          border: none;
          border-radius: 0;
          font-family: Input, 'Font Awesome 6 Free Solid';
          font-size: 14px;
          min-height: 0;
        }

        #workspaces button {
          padding: 0 10px;
          margin: 0 6px;
          background: transparent;
          color: @foreground;
          border-top: 3px solid @background;
          border-bottom: 3px solid transparent;
        }

        #workspaces button.active {
          border-bottom: 3px solid @green;
        }

        #workspaces button.urgent {
          border-bottom: 3px solid @yellow;
        }

        #submap {
          border-bottom: 3px solid @red;
        }

        #custom-usbguard,
        #custom-decrypted,
        #custom-updates,
        #custom-mail,
        #custom-vpn.off,
        #battery.warning,
        #disk.warning,
        #memory.warning,
        #cpu.warning,
        #custom-movie.on,
        #custom-dnd.dnd-notification,
        #custom-dnd.dnd-none {
          border-top: 3px solid @background;
          border-bottom: 3px solid @yellow;
        }

        #custom-security,
        #custom-systemd,
        #battery.critical,
        #disk.critical,
        #memory.critical,
        #cpu.critical,
        #custom-yubikey,
        #custom-eyes,
        #custom-recording {
          border-top: 3px solid @background;
          border-bottom: 3px solid @red;
        }

        #battery.charging {
          border-top: 3px solid @background;
          border-bottom: 3px solid @green;
        }

        #submap,
        #pulseaudio,
        #bluetooth,
        #custom-usbguard,
        #custom-yubikey,
        #custom-eyes,
        #custom-decrypted,
        #custom-security,
        #custom-systemd,
        #custom-updates,
        #custom-mail,
        #network,
        #cpu,
        #disk,
        #memory,
        #backlight,
        #battery,
        #custom-keymap,
        #custom-autosuspend,
        #clock {
          padding: 0 6px;
          margin: 0 6px;
        }

        #custom-vpn,
        #custom-dnd,
        #language,
        #custom-recording {
          padding: 0;
          margin: 0 6px;
        }

        #tray {
          margin-left: -1000000px;
        }

        #backlight,
        #battery,
        #custom-keymap,
        #custom-autosuspend,
        #clock,
        #cpu,
        #custom-eyes,
        #custom-mail,
        #custom-progress,
        #custom-recording,
        #custom-security,
        #custom-systemd,
        #custom-updates,
        #custom-usbguard,
        #custom-yubikey,
        #disk,
        #memory,
        #submap,
        #network,
        #bluetooth,
        #pulseaudio {
          color: @foreground;
        }

        #custom-decrypted,
        #custom-movie,
        #custom-vpn {
          color: @dim;
        }
        #custom-logout {
          padding: 0 6px;
        }
        #custom-autosuspend {
          font-size: 20px;
        }
      '';
    };
  };
}
