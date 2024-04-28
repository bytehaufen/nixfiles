{
  description = "My Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
    }:
    let
      pkgs = import nixpkgs { inherit system; };

      username = "rico";
      homeDirectory = "/home/${username}";
      system = "x86_64-linux";
      stateVersion = "23.11";

      userHomeModules = [
        (import ./home {
          inherit
            pkgs
            system
            username
            homeDirectory
            stateVersion
            ;
        })
      ];
    in
    {

      packages.x86_64-linux.default = home-manager.defaultPackage.x86_64-linux;
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;

      homeConfigurations = {
        ${username} = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = userHomeModules;
        };
      };
    };
}
