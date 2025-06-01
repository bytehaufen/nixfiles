{
  lib,
  config,
  vars,
  ...
}: {
  config = lib.mkIf config.opts.nixos.gui.enable {
    services.greetd = {
      enable = true;

      settings = {
        default_session = {
          user = vars.username;

          command = "$HOME/.wayland-session"; # Start a wayland session directly without a login manager
        };
      };
    };
  };
}
