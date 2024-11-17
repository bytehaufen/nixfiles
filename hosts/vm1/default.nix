{...}: {
  imports = [
    ./hardware-configuration.nix

    ../../nix
    ../common/global
    ../common/users/rico

    ../common/optional/kdeconnect.nix
    ../common/optional/pipewire.nix
    ../common/optional/wireless.nix
  ];

  networking = {
    hostName = "vm1";
    networkmanager.enable = true;
  };

  programs = {
    adb.enable = true;
    dconf.enable = true;
  };

  hardware.graphics.enable = true;

  system.stateVersion = "22.05";
}
