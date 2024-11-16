{
  lib,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/profiles/qemu-guest.nix")
  ];
  boot = {
    initrd.availableKernelModules = [
      "xhci_pci"
      "ohci_pci"
      "ehci_pci"
      "virtio_pci"
      "ahci"
      "usbhid"
      "sr_mod"
      "virtio_blk"
    ];
    kernelModules = ["kvm-intel"];
  };
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/b2420af7-9f22-4ba0-b5c5-527332dacf17";
    fsType = "ext4";
  };
  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/9019-D296";
    fsType = "vfat";
    options = ["fmask=0077" "dmask=0077"];
  };
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
