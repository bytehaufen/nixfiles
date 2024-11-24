{
  # config,
  modulesPath,
  ...
}:
# let
#   hostname = config.networking.hostName;
# in
{
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

    binfmt.emulatedSystems = [
      "aarch64-linux"
      "i686-linux"
    ];
  };
  # fileSystems = {
  #   "/" = {
  #     device = "/dev/disk/by-label/${hostname}";
  #     fsType = "btrfs";
  #     options = [
  #       "noatime"
  #       "compress=zstd"
  #     ];
  #   };
  #   "/home" = {
  #     device = "/dev/disk/by-label/${hostname}";
  #     fsType = "btrfs";
  #     options = [
  #       "noatime"
  #       "compress=zstd"
  #     ];
  #   };
  #
  #   "/nix" = {
  #     device = "/dev/disk/by-label/${hostname}";
  #     fsType = "ext4";
  #     options = [
  #       "noatime"
  #       "compress=zstd"
  #     ];
  #   };
  #
  #   "/swap" = {
  #    device = "/dev/disk/by-label/${hostname}";
  #     fsType = "ext4";
  #     options = [
  #       "subvol=swap"
  #       "noatime"
  #     ];
  #   };
  # };

  nixpkgs.hostPlatform.system = "x86_64-linux";
}
