{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./nixpkgs.nix
    ./substituters.nix
  ];

  # We need git for flakes
  environment.systemPackages = [pkgs.git];

  nix = {
    settings = {
      auto-optimise-store = true;
      builders-use-substitutes = true;
      experimental-features = ["nix-command" "flakes"];
      flake-registry = "/etc/nix/registry.json";

      # for direnv GC roots
      keep-derivations = true;
      keep-outputs = true;

      trusted-users = ["root" "@wheel"];
    };

    # extra builders to offload work onto
    # don't set a machine as a builder to itself (throws warnings)
    buildMachines = lib.filter (x: x.hostName != config.networking.hostName) [
      {
        system = "aarch64-linux";
        sshUser = "mihai";
        sshKey = "/etc/ssh/ssh_host_ed25519_key";
        maxJobs = 4;
        hostName = "alpha";
        protocol = "ssh-ng";
        supportedFeatures = ["nixos-test" "benchmark" "kvm" "big-parallel"];
      }
    ];
    distributedBuilds = true;
  };
}
