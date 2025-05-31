{...}: {
  imports = [
    # Agenix configuration and secrets
    ./agenix
    # Nix configuration
    ./nix.nix

    ./services
  ];
}
