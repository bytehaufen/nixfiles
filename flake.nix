{
  description = "My Home Manager configuration";

  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    agenix = {
      url = "github:yaxitech/ragenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    secrets = {
      url = "git+ssh://git@github.com/bytehaufen/nix-secrets.git";
      flake = false;
    };

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgsStable.url = "github:nixos/nixpkgs/nixos-24.05";

    hm = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/hyprland";

    nixGL = {
      url = "github:guibou/nixGL";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ags = {
      url = "github:Aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    anyrun = {
      url = "github:anyrun-org/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
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

    vars = import ./vars/default.nix;

    forEachSystem = f: lib.genAttrs (import systems) (system: f pkgsFor.${system});

    pkgsFor = lib.genAttrs (import systems) (
      system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          overlays = [
            # Add stable version of nixpkgs to pkgs -> pkgs.stable
            (_final: _prev: {stable = import nixpkgsStable {inherit system;};})
            # Enable JavaFX for jdk
            (_final: prev: {jdk = prev.jdk.override {enableJavaFX = true;};})
          ];
        }
    );
  in {
    inherit lib;

    devShells = forEachSystem (pkgs: {
      default = pkgs.mkShell {
        NIX_CONFIG = "extra-experimental-features = nix-command flakes ca-derivations";
        nativeBuildInputs = [
          pkgs.alejandra
          pkgs.git
          pkgs.just
        ];
      };
    });

    formatter = forEachSystem (pkgs: pkgs.alejandra);

    nixosConfigurations = {
      vm1 = lib.nixosSystem {
        specialArgs = {
          inherit inputs outputs vars;
          pkgs = pkgsFor.x86_64-linux;
        };
        modules = [
          ./hosts/vm1
        ];
      };

      loki = lib.nixosSystem {
        specialArgs = {
          inherit inputs outputs vars;
          pkgs = pkgsFor.x86_64-linux;
        };
        modules = [
          ./hosts/loki
        ];
      };
    };

    homeConfigurations = {
      "rico@arch" = lib.homeManagerConfiguration {
        modules = [
          ./home/rico/arch.nix
        ];
        pkgs = pkgsFor.x86_64-linux;
        extraSpecialArgs = {
          inherit inputs outputs vars;
        };
      };
      "rico@todd2" = lib.homeManagerConfiguration {
        modules = [
          ./home/rico/todd2.nix
        ];
        pkgs = pkgsFor.x86_64-linux;
        extraSpecialArgs = {
          inherit inputs outputs vars;
        };
      };
      "rico@vm1" = lib.homeManagerConfiguration {
        modules = [
          ./home/rico/vm1.nix
        ];
        pkgs = pkgsFor.x86_64-linux;
        extraSpecialArgs = {
          inherit inputs outputs vars;
        };
      };
    };
  };
}
