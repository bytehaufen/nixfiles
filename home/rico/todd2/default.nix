{pkgs, ...}: {
  xdg.desktopEntries = {
    coside = {
      name = "COSIDE";
      exec = "coside";
      terminal = false;
      type = "Application";
      categories = ["Development"];
    };

    coside-sdk = {
      name = "COSIDE SDK";
      exec = "coside-sdk";
      terminal = false;
      type = "Application";
      categories = ["Development"];
    };

    coseda-tunnel = {
      name = "COSEDA Tunnel";
      exec = "coseda-tunnel";
      terminal = false;
      type = "Application";
      categories = ["Development"];
    };
  };

  home.packages = [
    # COSIDE
    (pkgs.writeShellScriptBin "coside" ''
      source $XDG_CONFIG_HOME/zsh/.zshrc
      bash -c "COSIDE_SHELL_OPTIONS='-f -c gnome-terminal' GTK_THEME=Adwaita $HOME/coside/coside-latest/coside $@"
    '')

    # Eclipse COSIDE SDK
    (pkgs.writeShellScriptBin "coside-sdk" ''
      source $XDG_CONFIG_HOME/zsh/.zshrc

      # Force use light theme
      export GTK_THEME=Adwaita

      # Paths
      export COSIDE_INSTALL_PATH="$HOME/coside/coside-latest"
      COSIDE_SDK_DIR="$HOME/Apps/eclipse/coside-sdk-latest"

      # Helper
      SOURCE_COMMAND="source $COSIDE_INSTALL_PATH/coside --setenv"

      # Launch
      tcsh -c "cd $COSIDE_INSTALL_PATH && $SOURCE_COMMAND && $COSIDE_SDK_DIR/coside-sdk/eclipse -data $COSIDE_SDK_DIR/ws"
    '')

    (pkgs.writeShellScriptBin "coseda-tunnel" ''
      source $XDG_CONFIG_HOME/zsh/.zshrc

      while [ $# -ne 0 ]
      do
          case "$1" in
            --kill)
              kill=true
                  ;;
          esac
          shift
      done

      tunnel_command='ssh -f -N'
      hosts=`cat ~/.ssh/config | grep "Host " | awk '{print $2}' | grep "tunnel$"`
      for host in $hosts
      do
        PS=`pgrep -u $USER -a "ssh" | grep "$tunnel_command $host$"`
        PID=`echo $PS | awk '{print $1}'  | sed ':a;N;$!ba;s/\n/ /g'`

        if [ -n "$PID" ]; then
          echo "Kill existing tunnel for $host (PID=$PID)"
          kill -9 $PID
        fi

        if [ $1 -z "$kill" ] ; then
          echo "Create tunnel for $host"
          $tunnel_command $host
        fi
      done
    '')
  ];
}
