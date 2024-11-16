{
  inputs,
  outputs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./gamemode.nix
    ./kdeconnect.nix
    ./locale.nix
    ./nix.nix
    ./nix-ld.nix
    ./openssh.nix
    ./podman.nix
    ./prometheus-node-exporter.nix
    ./steam-hardware.nix
    ./systemd-initrd.nix
    ./upower.nix
    ./zsh.nix
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs outputs;};
  };

  hardware.enableRedistributableFirmware = true;

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
}
