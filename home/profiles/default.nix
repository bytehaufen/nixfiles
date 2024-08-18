{
  self,
  inputs,
  ...
}: let
  extraSpecialArgs = {inherit inputs self;};

  inherit (inputs.hm.lib) homeManagerConfiguration;

  system = "x86_64-linux";
  pkgs = inputs.nixpkgs.legacyPackages.${system};
in {
  flake = {
    homeConfigurations = {
      "rico@arch" = homeManagerConfiguration {
        modules = [
          ../.
          ./arch
          {
            nixGLPrefix = "${inputs.nixGL.packages.${system}.nixGLIntel}/bin/nixGLIntel ";
          }
          inputs.stylix.homeManagerModules.stylix
        ];
        inherit pkgs extraSpecialArgs;
      };
    };
  };
}
