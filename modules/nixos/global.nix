{
  outputs,
  pkgs,
  ...
}: {
  # Enable firmware that is no FOSS
  hardware.enableRedistributableFirmware = true;

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
    };
  };

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  environment.pathsToLink = ["/share/zsh"];
}
