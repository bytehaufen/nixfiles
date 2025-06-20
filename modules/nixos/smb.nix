{
  pkgs,
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.opts.nixos.smb.enable {
    # For mount.cifs, required unless domain name resolution is not needed.
    environment.systemPackages = [pkgs.cifs-utils];

    fileSystems."/mnt/NAS" = {
      device = "//192.168.178.100/NAS";
      fsType = "cifs";
      options = let
        # This line prevents hanging on network split
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
      in ["${automount_opts},credentials=${config.age.secrets.smb-secrets.path}"];
    };

    services.gvfs = {
      enable = true;
      package = lib.mkForce pkgs.gnome.gvfs;
    };
  };
}
