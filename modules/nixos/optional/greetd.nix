{vars, ...}: {
  services.greetd = {
    enable = true;

    settings = {
      default_session = {
        user = vars.username;

        command = "$HOME/.wayland-session"; # Start a wayland session directly without a login manager
      };
    };
  };
}
