{
  description = "My Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";

    stylix.url = "github:danth/stylix";

    nixGL.url = "github:guibou/nixGL";
    nixGL.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
  };

  outputs = {
    nixpkgs,
    home-manager,
    flake-utils,
    stylix,
    nixGL,
    hyprland,
    ...
  } @ inputs: let
    supportedSystems = [
      "aarch64-linux"
      "x86_64-linux"
    ];
  in
    flake-utils.lib.eachSystem supportedSystems (system: let
      pkgs = import nixpkgs {
        inherit system;
      };
    in {
      devShells = import ./shell.nix {inherit pkgs;};

      formatter = pkgs.alejandra;

      packages.homeConfigurations = {
        "rico-arch" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            stylix.homeManagerModules.stylix
            ./users/rico-arch.nix
            {
              home.username = "rico";
              nixGLPrefix = "${nixGL.packages.x86_64-linux.nixGLIntel}/bin/nixGLIntel ";
            }
          ];
          extraSpecialArgs = {
            inherit inputs;
            inherit hyprland;
          };
        };
      };
    });
}
