{
  pkgs,
  lib,
  config,
  ...
}: {
  options.opts.services.polkit-agent.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable polkit agent";
  };
  config = lib.mkIf config.opts.services.polkit-agent.enable {
    systemd.user.services.polkit-gnome-authentication-agent-1 = {
      Unit.Description = "polkit-gnome-authentication-agent-1";

      Install = {
        WantedBy = ["graphical-session.target"];
        Wants = ["graphical-session.target"];
        After = ["graphical-session.target"];
      };

      Service = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };
}
