{inputs, ...}: {
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./theme.nix
    ./fonts.nix
  ];
}
