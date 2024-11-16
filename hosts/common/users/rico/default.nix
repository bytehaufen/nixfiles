{
  pkgs,
  config,
  ...
}: let
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
  users.mutableUsers = true; # FIXME: Set to false when ssh config is complete
  users.users.rico = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = ifTheyExist [
      "audio"
      "docker"
      "git"
      "libvirtd"
      "lxd"
      "mysql"
      "network"
      "podman"
      "video"
      "wheel"
    ];

    packages = [pkgs.home-manager];
  };

  home-manager.users.rico = import ../../../../home/rico/${config.networking.hostName}.nix;

  security.pam.services = {
    swaylock = {};
  };
}
