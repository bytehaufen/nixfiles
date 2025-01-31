{
  config,
  lib,
  pkgs,
  ...
}: let
  notification-time = "3000";

  swaylock = lib.getExe config.programs.swaylock.package;
  hyprctl = "${config.wayland.windowManager.hyprland.package}/bin/hyprctl";
  wf-recorder = lib.getExe pkgs.wf-recorder;
  notify-send = "${pkgs.libnotify}/bin/notify-send";
  ffmpeg = lib.getExe pkgs.ffmpeg;
  wl-copy = "${pkgs.wl-clipboard}/bin/wl-copy";
  slurp = lib.getExe pkgs.slurp;
  grim = lib.getExe pkgs.grim;
  swappy = lib.getExe pkgs.swappy;
  jq = lib.getExe pkgs.jq;
in {
  # Let system suspend with lock screen
  pause-system = pkgs.writeShellScriptBin "pause-system" ''
    ${swaylock} &
    systemctl suspend
  '';

  # Make screen record and save it as mkv and gif
  record-area = pkgs.writeShellScriptBin "record-area" ''
    RECORD_PATH=$HOME/Videos/screenrecords

    if ! pkill -x wf-recorder -SIGINT; then
      ${hyprctl} keyword decoration:dim_strength 0

      mkdir -p "$RECORD_PATH"
      path="$RECORD_PATH/record-$(date +%Y%m%d%H%M%S)"
      ${notify-send} -t ${notification-time} 'Screen recording' 'Select an area to start the recording...'
      geometry="$(${slurp} -c '#${config.colorScheme.palette.base0F}' -w 2 -d -o)"
      echo geometry: $geometry
      sleep 0.2 # slurp needs time to remove the red border...
      ${wf-recorder} -g "$geometry" -f "$path.mkv"

      ${hyprctl} keyword decoration:dim_strength 0.2

      ${ffmpeg} -i "$path.mkv" -vf "fps=15,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" "$path.gif"
      ${notify-send} -t ${notification-time} 'Screen recording' "Recording is ready: $path.{mkv,gif}"

      ${wl-copy} -t image/gif <"$path.gif"
      echo "file://$path.mkv" | ${wl-copy} -t text/uri-list
    fi &
  '';

  # Make a screenshot of the screen (including all monitors) and a selected area
  screenshot-area = pkgs.writeShellScriptBin "screenshot-area" ''
     mkdir -p ~/Pictures/screenshots
     cd ~/Pictures/screenshots || exit

     ${hyprctl} keyword decoration:dim_strength 0

     OUTPUT=$(${hyprctl} monitors -j | ${jq} -r '.[] | select(.focused)' | ${jq} -r '.name')
     ${grim} -o "$OUTPUT" -t png "screen-$(date +%Y%m%d%H%M%S).png"

     geometry="$(${slurp} -c '#ff3f3faf' -w 2 -d -o)"
     sleep 0.5 # slurp needs time to remove the red border...

     if [ -n "$geometry" ]; then
     	${grim} -g "$geometry" -t png area.png
     else
     	${grim} -t png area.png
     fi

    if [ -f area.png ]; then
      AREA_FILENAME=area-"$(date +%Y%m%d-%H%M%S)".png
      mv area.png "$AREA_FILENAME"
      ${swappy} -f "$AREA_FILENAME" -o "''${AREA_FILENAME%.png}-annotated.png"
    fi

     ${hyprctl} keyword decoration:dim_strength 0.2
  '';

  # Set hyprland to the next xkb layout    y
  next-xkb-layout = pkgs.writeShellScriptBin "next-xkb-layout" ''
    # Goto next xkb layout for all keyboards
    ${hyprctl} \
      --batch "$(
        ${hyprctl} devices -j |
          ${jq} -r '.keyboards[] | .name' |
          while IFS= read -r keyboard; do
            printf '%s %s %s;' 'switchxkblayout' "''${keyboard}" 'next'
          done
      )"

    # Notyfy about the change
    lang=$(${hyprctl} devices -j | ${jq} -r '.keyboards[0].active_keymap' | tr '[:lower:]' '[:upper:]')
    ${notify-send} -t ${notification-time} "Keyboard layout" "Switched to $lang"
  '';

  # Set Monitor to mirrored
  set-monitors-mirrored = pkgs.writeShellScriptBin "set-monitors-mirrored" ''
    PRIMARY="eDP-1"

    for monitor in $(${hyprctl} monitors | grep "Monitor" | awk '{print $2}'); do
      if [ "''${monitor}" != "''${PRIMARY}" ]; then
        ${hyprctl} keyword monitor "''${monitor},preferred,auto,1,mirror,''${PRIMARY}"
      fi
    done

    ${notify-send} -t ${notification-time} "Monitors set to mirrored"
  '';
}
