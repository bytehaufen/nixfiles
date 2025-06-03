{outputs, ...}: {
  # Enable firmware that is no FOSS
  hardware.enableRedistributableFirmware = true;

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
    };
  };
}
