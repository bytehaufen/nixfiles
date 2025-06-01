{
  config,
  pkgs,
  lib,
  ...
}: let
  dockerEnabled = config.virtualisation.docker.enable;
in {
  virtualisation.podman = {
    enable = true;
    dockerCompat = !dockerEnabled;
    dockerSocket.enable = !dockerEnabled;
    defaultNetwork.settings.dns_enabled = true;
  };
  environment.systemPackages = lib.mkIf config.virtualisation.podman.enable [pkgs.podman-compose];
}
