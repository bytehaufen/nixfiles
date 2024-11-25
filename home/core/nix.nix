{
  pkgs,
  lib,
  ...
}: {
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
      allowUnsupportedSystem = true;
      experimental-features = "nix-command flakes ca-derivations";
    };
  };

  # NOTE: On Non-NixOS systems, the user needs to have the access rights to the nix daemon.
  # So add "trusted-users = foo" to `/etc/nix/nix.conf` for user foo.
  # Restart nix daemon `sudo systemctl restart nix-daemon.service`
  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      extra-substituters = [
        "https://nix-community.cachix.org"
      ];
      extra-trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      experimental-features = [
        "nix-command"
        "flakes"
        "ca-derivations"
      ];
      accept-flake-config = true;
      warn-dirty = false;
    };
  };
}
