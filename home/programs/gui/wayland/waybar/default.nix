{
  lib,
  pkgs,
  config,
  ...
}: let
  commonDeps = with pkgs; [coreutils gnugrep systemd];

  # Function to simplify making waybar outputs
  mkScript = {
    name ? "script",
    deps ? [],
    script ? "",
  }:
    lib.getExe (pkgs.writeShellApplication {
      inherit name;
      text = script;
      runtimeInputs = commonDeps ++ deps;
    });

  # Specialized for JSON outputs
  mkScriptJson = {
    name ? "script",
    deps ? [],
    script ? "",
    text ? "",
    tooltip ? "",
    alt ? "",
    class ? "",
    percentage ? "",
  }:
    mkScript {
      inherit name;
      deps = [pkgs.jq] ++ deps;
      script = ''
        ${script}
        jq -cn \
          --arg text "${text}" \
          --arg tooltip "${tooltip}" \
          --arg alt "${alt}" \
          --arg class "${class}" \
          --arg percentage "${percentage}" \
          '{text:$text,tooltip:$tooltip,alt:$alt,class:$class,percentage:$percentage}'
      '';
    };
in {
  imports = [./style.nix];

  programs.waybar = {
    enable = true;
    systemd.enable = false;
    settings = {
      primary = {
        exclusive = true;
        passthrough = false;
        reload_style_on_change = true;
        height = 32;
        position = "top";
        modules-left = [
          "custom/menu"
          "hyprland/workspaces"
          "hyprland/submap"
          "custom/currentplayer"
          "custom/player"
        ];

        modules-center = [
          "cpu"
          "memory"
          "clock"
          "custom/unread-mail"
        ];

        modules-right = [
          "tray"
          "custom/rfkill"
          "network"
          "pulseaudio"
          "battery"
          "custom/hostname"
        ];

        /*
        modules-left
        */
        "custom/menu" = {
          interval = 1;
          return-type = "json";
          exec = mkScriptJson {
            text = "";
            tooltip = ''$(grep PRETTY_NAME /etc/os-release | cut -d '"' -f2)'';
            class = let
              isFullScreen = "hyprctl activewindow -j | jq -e '.fullscreen' &>/dev/null";
            in "$(if ${isFullScreen}; then echo fullscreen; fi)";
          };
          on-click = mkScript {
            script = ''
              "${lib.getExe config.programs.anyrun.package}"
            '';
          };
        };

        "custom/currentplayer" = {
          interval = 2;
          return-type = "json";
          exec = mkScriptJson {
            deps = [pkgs.playerctl];
            script = ''
              all_players=$(playerctl -l 2>/dev/null)
              selected_player="$(playerctl status -f "{{playerName}}" 2>/dev/null || true)"
              clean_player="$(echo "$selected_player" | cut -d '.' -f1)"
            '';
            alt = "$clean_player";
            tooltip = "$all_players";
          };
          format = "{icon}{}";
          format-icons = {
            "" = " ";
            "Celluloid" = "󰎁 ";
            "spotify" = "󰓇 ";
            "ncspot" = "󰓇 ";
            "qutebrowser" = "󰖟 ";
            "firefox" = " ";
            "discord" = " 󰙯 ";
            "sublimemusic" = " ";
            "kdeconnect" = "󰄡 ";
            "chromium" = " ";
          };
        };
        "custom/player" = {
          exec-if = mkScript {
            deps = [pkgs.playerctl];
            script = ''
              selected_player="$(playerctl status -f "{{playerName}}" 2>/dev/null || true)"
              playerctl status -p "$selected_player" 2>/dev/null
            '';
          };
          exec = mkScript {
            deps = [pkgs.playerctl];
            script = ''
              selected_player="$(playerctl status -f "{{playerName}}" 2>/dev/null || true)"
              playerctl metadata -p "$selected_player" \
                --format '{"text": "{{artist}} - {{title}}", "alt": "{{status}}", "tooltip": "{{artist}} - {{title}} ({{album}})"}' 2>/dev/null
            '';
          };
          return-type = "json";
          interval = 2;
          max-length = 30;
          format = "{icon} {}";
          format-icons = {
            "Playing" = "󰐊";
            "Paused" = "󰏤 ";
            "Stopped" = "󰓛";
          };
          on-click = mkScript {
            deps = [pkgs.playerctl];
            script = "playerctl play-pause";
          };
        };

        /*
        modules-center
        */
        cpu = {
          format = "  {usage}%";
          on-click = mkScript {
            deps = [pkgs.kitty pkgs.btop];
            script = "${lib.getExe pkgs.kitty} ${lib.getExe pkgs.btop}";
          };
        };

        memory = {
          format = "  {}%";
          interval = 5;
          on-click = mkScript {
            deps = [pkgs.kitty pkgs.btop];
            script = "${lib.getExe pkgs.kitty} ${lib.getExe pkgs.btop}";
          };
        };

        clock = {
          interval = 1;
          format = "{:%d/%m %H:%M}";
          format-alt = "{:%Y-%m-%d %H:%M:%S %z}";
          on-click-left = "mode";
          tooltip-format = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>'';
        };

        "custom/unread-mail" = {
          interval = 5;
          return-type = "json";
          exec = mkScriptJson {
            deps = [pkgs.findutils pkgs.procps];
            script = ''
              count=$(find ~/Mail/*/Inbox/new -type f | wc -l)
              if pgrep mbsync &>/dev/null; then
                status="syncing"
              else
                if [ "$count" == "0" ]; then
                  status="read"
                else
                  status="unread"
                fi
              fi
            '';
            text = "$count";
            alt = "$status";
          };
          format = "{icon}  ({})";
          format-icons = {
            "read" = "󰇯";
            "unread" = "󰇮";
            "syncing" = "󰁪";
          };
        };

        /*
        modules-right
        */
        "custom/rfkill" = {
          interval = 1;
          exec-if = mkScript {
            deps = [pkgs.util-linux];
            script = "rfkill | grep '\<blocked\>'";
          };
        };

        network = {
          interval = 3;
          format-wifi = "   {essid}";
          format-ethernet = "󰈁 Connected";
          format-disconnected = "";
          tooltip-format = ''
            {ifname}
            {ipaddr}/{cidr}
            Up: {bandwidthUpBits}
            Down: {bandwidthDownBits}'';
        };

        pulseaudio = {
          format-source = "󰍬 {volume}%";
          format-source-muted = "󰍭 0%";
          format = "{icon} {volume}% {format_source}";
          format-muted = "󰸈 0% {format_source}";
          format-icons = {
            default = [
              "󰕿"
              "󰖀"
              "󰕾"
            ];
          };
          on-click = lib.getExe pkgs.pwvucontrol;
        };

        battery = {
          interval = 10;
          format-icons = [
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          states = {
            full = 100;
            normal = 90;
            warning = 25;
            critical = 10;
          };
          onclick = "";
        };

        "custom/hostname" = {
          exec = mkScript {
            script = ''
              echo "$USER@$HOSTNAME"
            '';
          };
          on-click = mkScript {
            script = ''
              if command -v hyprctl &> /dev/null; then
                # Hyprland kills and starts waybar on reload
                hyprctl reload
              else
                pkill waybar
                ${lib.getExe pkgs.waybar}
              fi

            '';
          };
        };
      };
    };
  };
}
