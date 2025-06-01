{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.opts.nixos.services.kdeconnect.enable {
    networking.firewall = {
      allowedTCPPortRanges = [
        {
          from = 1714;
          to = 1764;
        }
      ];
      allowedUDPPortRanges = [
        {
          from = 1714;
          to = 1764;
        }
      ];
    };
  };
}
