let
  background = "rgba(26, 27, 38, 0.7)";
  foreground = "#c0caf5";
  primary = "#7aa2f7";
  primaryOn = "#a9b1d6";
in
  # css
  ''
    * {
      font-family: "DejaVu Sans", "FiraCode Nerd Font";
      font-size: 12pt;
      padding: 0;
      margin: 0 0.4em;
    }

    window#waybar {
      padding: 0;
      border-radius: 0.5em;
      background: ${background};
      color: ${foreground};
    }
    .modules-left {
      margin-left: -0.65em;
    }
    .modules-right {
      margin-right: -0.65em;
    }

    #workspaces button {
      background-color: ${background};
      color: ${foreground};
      padding-left: 0.4em;
      padding-right: 0.4em;
      margin-top: 0.15em;
      margin-bottom: 0.15em;
    }
    #workspaces button.hidden {
      background-color: ${background};
      color: ${foreground};
    }
    #workspaces button.focused,
    #workspaces button.active {
      background-color: ${primary};
      color: ${primaryOn};
    }

    #clock {
      padding-right: 1em;
      padding-left: 1em;
      border-radius: 0.5em;
    }

    #custom-menu {
      background-color: ${background};
      color: ${primary};
      padding-right: 1.5em;
      padding-left: 1em;
      margin-right: 0;
      border-radius: 0.5em;
    }
    #custom-menu.fullscreen {
      background-color: ${primary};
      color: ${primaryOn};
    }
    #custom-hostname {
      background-color: ${background};
      color: ${primary};
      padding-right: 1em;
      padding-left: 1em;
      margin-left: 0;
      border-radius: 0.5em;
    }
    #custom-currentplayer {
      padding-right: 0;
    }
    #tray {
      color: ${foreground};
    }
    #cpu, #memory {
      margin-left: 0.05em;
      margin-right: 0.55em;
    }
  ''
