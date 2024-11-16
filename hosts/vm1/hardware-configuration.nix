{config, lib, pkgs, modulesPath, ...}:
{
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
}
