{pkgs, ...}: {
  home.packages = [
    (pkgs.writeShellScriptBin "rockylinux" ''
      # This script sets up and manages a Rocky Linux container using distrobox.
      # It checks if the container exists, creates it if necessary, and then enters the container.
      # If a command is provided, it executes the command inside the container.

      # Set IMPURE to true to avoid using a clean environment
      IMPURE=true # Call `distrobox rm <CONTAINER_NAME>`, if changing this
      # Define the image to be used
      IMAGE="quay.io/toolbx-images/rockylinux-toolbox:9"
      # Set the name of the container
      CONTAINER_NAME="rocky"
      # Define the home directory for the container, unused if `$IMPURE` is true
      CONTAINER_HOME="$HOME/rockylinux-home"
      export GDK_BACKEND=x11 # Do not use wayland, cause Eclipse hates it

      # Commands to run before initializing the container
      PRE_INIT_HOOKS="\"dnf -y install dnf-plugins-core && dnf install -y 'dnf-command(config-manager)' && dnf config-manager --enable crb devel && dnf -y install epel-release redhat-lsb-core glibc libstdc++ ncurses ncurses-libs ncurses-devel gcc-c++ webkit2gtk3 nautilus PackageKit-gtk3-module libserf tcsh libxcrypt-compat subversion-javahl && sudo ln -s /usr/lib64/libtinfo.so /usr/lib64/libtinfo.so.5 \""

      # Command to create the container
      CREATE_CMD="distrobox create -n $CONTAINER_NAME --init --image $IMAGE --pre-init-hooks $PRE_INIT_HOOKS"

      # If already in a container, just exec the command
      if [ -n "$CONTAINER_ID" ]; then
        echo Starting command inside container...
        exec "$@"
        exit 0
      fi

      # For a clean environment
      if [ "$IMPURE" = false ]; then
        CREATE_CMD="$CREATE_CMD --home $CONTAINER_HOME"
      fi

      # Create container if not existent
      if ! distrobox ls | awk -F'|' '{print $2}' | grep -q "^\s*$CONTAINER_NAME\s*$"; then
        echo Container \"$CONTAINER_NAME\" not found, creating...
        echo "Running command: $CREATE_CMD"

        if ! eval "$CREATE_CMD"; then
          echo Failed to create container

          exit 1
        fi
      fi

      export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/rico/bin:$PATH

      # Enter Container
      if [ "$#" -eq 0 ]; then
        echo Starting $CONTAINER_NAME...
        distrobox enter $CONTAINER_NAME
      else
        echo Starting $CONTAINER_NAME with command: "$@"
        distrobox enter $CONTAINER_NAME -- "$@"
      fi
    '')
  ];
}
