{...}: {
  imports = [./cli/nnn/nnn.nix];

  programs.home-manager.enable = true;

  programs.git.enable = true;
  #TODO: fix!
}
