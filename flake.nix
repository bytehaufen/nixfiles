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
    pkgs = import nixpkgs {inherit system;};

    stateVersion = "23.11";
    system = "x86_64-linux";

    userHomeModules = username: [
      (import ./home {
        inherit pkgs system username stateVersion;

        homeDirectory = "/home/${username}";
      })
    ];
  in {
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
