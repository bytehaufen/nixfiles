{
  imports = [
    ./agenix
    ./greetd.nix
    ./hyprland.nix
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
    ./kdeconnect.nix
    ./misc.nix
    ./pipewire.nix
    ./quietboot.nix
    ./wireless.nix

    # TODO: Make optional
    ./home-manager.nix
    ./nix-ld.nix
    ./podman.nix
  ];
}
