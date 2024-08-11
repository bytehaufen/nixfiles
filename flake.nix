{
  description = "My Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    nixGL = {
      url = "github:guibou/nixGL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];
      imports = [
      ];
      perSystem = {
        config,
        pkgs,
        system,
        ...
      }: {
        legacyPackages.homeConfigurations = {
          rico = inputs.home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            extraSpecialArgs = {};
            modules = [
              ./home
              {
                home.username = "rico";
                home.stateVersion = "23.11";
                home.homeDirectory = "/${
                  if pkgs.stdenv.isDarwin
                  then "Users"
                  else "home"
                }/rico";
                nixGLPrefix = "${inputs.nixGL.packages.${system}.nixGLIntel}/bin/nixGLIntel ";
              }
            ];
          };
        };

        devShells.default = pkgs.mkShell {
          packages = [
            pkgs.alejandra
            pkgs.git
          ];
          nativeBuildInputs = [
            pkgs.just
          ];
        };

        formatter = pkgs.alejandra;
      };
    };
}
