{
  imports = [
    ./agenix
    ./greetd.nix
    ./hyprland.nix
    ./locale.nix
    ./kdeconnect.nix
    ./networking.nix
    ./nix.nix
    ./nixos-options.nix
    ./openssh.nix
    ./pipewire.nix
    ./security.nix
    ./smb.nix
    ./systemd-initrd.nix
    ./upower.nix

    # TODO: Continue here
    ./global.nix
    ./misc.nix
    ./quietboot.nix
    ./wireless.nix

    # TODO: Make optional
    ./home-manager.nix
    ./nix-ld.nix
    ./podman.nix
  ];
}
