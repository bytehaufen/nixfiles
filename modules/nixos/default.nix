{
  imports = [
    ./agenix
    ./locale.nix
    ./networking.nix
    ./nix.nix
    ./nixos-options.nix
    ./openssh.nix
    ./security.nix

    ./smb.nix
    ./systemd-initrd.nix
    ./upower.nix
    ./global.nix
    ./optional/greetd.nix
    ./optional/hyprland.nix
    ./optional/kdeconnect.nix
    ./optional/misc.nix
    ./optional/pipewire.nix
    ./optional/quietboot.nix
    ./optional/wireless.nix

    # TODO: Make optional
    ./home-manager.nix
    ./nix-ld.nix
    ./podman.nix
  ];
}
