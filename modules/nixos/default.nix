{
  imports = [
    ./agenix
    ./greetd.nix
    ./hyprland.nix
    ./locale.nix
    ./kdeconnect.nix
    ./networking.nix
    ./nix.nix
    ./nix-ld.nix
    ./nixos-options.nix
    ./openssh.nix
    ./pipewire.nix
    ./podman.nix
    ./quietboot.nix
    ./security.nix
    ./smb.nix
    ./systemd-initrd.nix
    ./upower.nix
    ./wireless.nix

    # TODO: Continue here
    ./global.nix
    ./misc.nix

    # TODO: Make optional
    ./home-manager.nix
  ];
}
