{
  description = "My Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgsStable.url = "github:nixos/nixpkgs/nixos-24.05";

    hm = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixGL = {
      url = "github:guibou/nixGL";
      inputs.nixpkgs.follows = "nixpkgs";
      # TODO: Use it with home-manager; see [home.manager#pull#5355](https://github.com/nix-community/home-manager/pull/5355#issuecomment-2426908650)
    };

    ags = {
      url = "github:Aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    anyrun = {
      url = "github:anyrun-org/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgsStable,
    home-manager,
    systems,
    ...
  } @ inputs: let
    inherit (self) outputs;
    lib = nixpkgs.lib // home-manager.lib;
    forEachSystem = f: lib.genAttrs (import systems) (system: f pkgsFor.${system});
    pkgsFor = lib.genAttrs (import systems) (
      system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          overlays = [
            (_final: _prev: {stable = import nixpkgsStable {inherit system;};})
          ];
        }
    );
  in {
    inherit lib;

    devShells = forEachSystem (pkgs: {
      default = pkgs.mkShell {
        NIX_CONFIG = "extra-experimental-features = nix-command flakes";
        nativeBuildInputs = [
          pkgs.alejandra
          pkgs.git
          pkgs.just
        ];
      };
    });

    formatter = forEachSystem (pkgs: pkgs.alejandra);

    homeConfigurations = let
      system = "x86_64-linux";
    in {
      "rico-arch" = lib.homeManagerConfiguration {
        modules = [
          ./home/rico/arch.nix
          {nixGLPrefix = "${inputs.nixGL.packages.${system}.nixGLIntel}/bin/nixGLIntel ";}
        ];
        pkgs = pkgsFor.x86_64-linux;
        extraSpecialArgs = {
          inherit inputs outputs;
        };
      };
    };
  };
}
