{...}: {
  imports = [
    ./hardware-configuration.nix
    ./disko-config.nix

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

  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        consoleMode = "max";
      };
      efi.canTouchEfiVariables = true;
    };

    # For cross-compilation
    binfmt.emulatedSystems = [
      "aarch64-linux"
      "i686-linux"
    ];
  };

  system.stateVersion = "22.05";
}
