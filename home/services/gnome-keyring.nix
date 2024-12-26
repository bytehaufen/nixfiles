{
  lib,
  config,
  pkgs,
  ...
}: {
  options.opts.services.gnome-keyring.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable gnome-keyring";
  };

  config = lib.mkIf config.opts.services.gnome-keyring.enable {
    home.packages = [pkgs.gnome-keyring];

    services.gnome-keyring.enable = true;
  };
}
