{
  self,
  inputs,
  ...
}: let
  extraSpecialArgs = {inherit inputs self;};

  homeImports = {
    "rico@arch" = [
      ../.
      ./arch
    ];
  };

  inherit (inputs.hm.lib) homeManagerConfiguration;

  pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
in {
  # we need to pass this to NixOS' HM module
  _module.args = {inherit homeImports;};

  flake = {
    homeConfigurations = {
      "rico@arch" = homeManagerConfiguration {
        modules = homeImports."rico@arch";
        inherit pkgs extraSpecialArgs;
      };
    };
  };
}
