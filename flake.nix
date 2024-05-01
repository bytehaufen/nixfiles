{
  description = "My Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils = {
      url = "github:numtide/flake-utils";
      # inputs.nixpkgs.follows = "nixpkgs";
      };
  };

  outputs = {
    nixpkgs,
    home-manager,
    flake-utils,
    ...
  }:
  let
    supportedSystems = [
      "aarch64-darwin"
      "aarch64-linux"
      "x86_64-linux"
    ];
in
 flake-utils.lib.eachSystem supportedSystems (system:
    let 
    pkgs = nixpkgs.legacyPackages.${system};


    userHomeModules = username: [
      (import ./home/home.nix {
        inherit pkgs system username;

        homeDirectory = "/home/${username}";
      })
    ];
  in {
    devShells = import ./shell.nix {inherit pkgs;};

    formatter.${system} = pkgs.alejandra;

    packages.homeConfigurations = {
      "rico@arch" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = userHomeModules "rico";
      };
    };
  });
}
