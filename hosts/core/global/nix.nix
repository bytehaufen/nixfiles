{
  lib,
  vars,
  pkgs,
  ...
}: {
  nix = {
    package = pkgs.nixVersions.latest;
    settings = {
      trusted-users = [
        "root"
        "@wheel"
        vars.username
      ];
      auto-optimise-store = lib.mkDefault true;
      experimental-features = [
        "nix-command"
        "flakes"
        "ca-derivations"
      ];
      warn-dirty = false;
      system-features = [
        "kvm"
        "big-parallel"
        "nixos-test"
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      # Keep the last 3 generations
      options = "--delete-older-than +3";
    };
  };
}
