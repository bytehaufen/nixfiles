{
  lib,
  config,
  pkgs,
  ...
}: {
  config = lib.mkIf config.opts.nixos.gui.enable {
    security = {
      pam.services.greetd.enableGnomeKeyring = true;
      polkit.enable = true;
    };
    services = {
      gnome.gnome-keyring.enable = true;
      udev.packages = with pkgs; [
        gnome-settings-daemon
      ];
    };
  };
}
