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
    quietboot = mkEnableOption "Enable quiet boot mode to reduce boot messages";
    smb = mkEnableOption "Enable SMB/CIFS file sharing support in NixOS";
    wireless = mkEnableOption "Enable wireless networking support in NixOS";

    programs = {
      hyprland = mkEnableOption "Enable Hyprland as the window manager";
      podman = mkEnableOption "Enable Podman for container management";
      nix-ld = mkEnableOption "Enable Nix-LD for dynamic linking with Nix packages";
    };

    services = {
      kdeconnect = mkEnableOption "Enable KDE Connect service for device integration";
      pipewire = mkEnableOption "Enable PipeWire for audio and video handling";
      upower = mkEnableOption "Enable UPower service for power management";
    };
  };
}
