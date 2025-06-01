{lib, ...}: let
  mkEnableOption = desc: {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = desc;
    };
  };
in {
  options.opts.nixos = {
    gui = mkEnableOption "Enable GUI applications in the nixos";
    smb = mkEnableOption "Enable SMB/CIFS file sharing support in NixOS";
    services = {
      upower = mkEnableOption "Enable UPower service for power management";
    };
  };
}
