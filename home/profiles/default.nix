{
  self,
  inputs,
  ...
}: let
  pkgs-stable = inputs.nixpkgs-stable.legacyPackages.${system};
  extraSpecialArgs = {inherit inputs self pkgs-stable;};

  inherit (inputs.hm.lib) homeManagerConfiguration;

  system = "x86_64-linux";
  pkgs = inputs.nixpkgs.legacyPackages.${system};
in {
  flake = {
    homeConfigurations = {
      "rico-arch" = homeManagerConfiguration {
        modules = [
          ../.
          ./arch
          {
            nixGLPrefix = "${inputs.nixGL.packages.${system}.nixGLIntel}/bin/nixGLIntel ";
          }
        ];
        inherit pkgs extraSpecialArgs;
      };
    };
  };
}
