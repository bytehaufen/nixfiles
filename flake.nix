{
  description = "My Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
  }: let
    forAllSystems = nixpkgs.lib.genAttrs [
      "x86_64-linux"
    ];

    pkgs = import nixpkgs {inherit system;};

    stateVersion = "23.11";
    system = "x86_64-linux";

    userHomeModules = username: [
      (import ./home/home.nix {
        inherit pkgs system username stateVersion;

        homeDirectory = "/home/${username}";
      })
    ];
  in {
    devShells = forAllSystems (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in
        import ./shell.nix {inherit pkgs;}
    );

    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
    packages.x86_64-linux.default = home-manager.defaultPackage.x86_64-linux;

    homeConfigurations = {
      "rico@arch" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = userHomeModules "rico";
      };
    };
  };
}
