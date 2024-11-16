{
  config,
  modulesPath,
  ...
}: let
  hostname = config.networking.hostName;
in {
  imports = [
    (modulesPath + "/profiles/qemu-guest.nix")
  ];
  boot = {
    initrd = {
      availableKernelModules = [
        "xhci_pci"
        "ohci_pci"
        "ehci_pci"
        "usb_storage"
        "virtio_pci"
        "ahci"
        "usbhid"
        "sr_mod"
        "sd_mod"
        "virtio_blk"
      ];
      kernelModules = ["kvm-intel"];
    };

    loader = {
      systemd-boot = {
        enable = true;
        consoleMode = "max";
      };
      efi.canTouchEfiVariables = true;
    };
  };
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/${hostname}";
      fsType = "ext4";
      options = [
        "subvol=root"
      ];
    };

    "/nix" = {
      device = "/dev/disk/by-label/${hostname}";
      fsType = "ext4";
      options = [
        "subvol=nix"
        "noatime"
      ];
    };

    "/swap" = {
      device = "/dev/disk/by-label/${hostname}";
      fsType = "ext4";
      options = [
        "subvol=swap"
        "noatime"
      ];
    };
  };
  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-label/ESP";
      fsType = "vfat";
    };
  };

  swapDevices = [
    {
      device = "/swap/swapfile";
      size = 8196;
    }
  ];

  nixpkgs.hostPlatform.system = "x86_64-linux";
}
