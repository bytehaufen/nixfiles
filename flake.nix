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

    anyrun = {
      url = "github:anyrun-org/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-colors.url = "github:misterio77/nix-colors";

    nixGL = {
      url = "github:guibou/nixGL";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgsStable.url = "github:nixos/nixpkgs/nixos-24.11";

    secrets = {
      url = "git+ssh://git@github.com/bytehaufen/nix-secrets.git";
      flake = false;
    };
  };

  outputs = {
    home-manager,
    nixpkgs,
    self,
    systems,
    ...
  } @ inputs: let
    inherit (self) outputs;

    lib = nixpkgs.lib // home-manager.lib;

    vars = import ./vars/default.nix;

    forAllSystems = lib.genAttrs (import systems);
  in {
    inherit lib;

    overlays = import ./overlays {inherit inputs outputs;};

    checks = forAllSystems (system: {
      pre-commit-check = inputs.pre-commit-hooks.lib.${system}.run {
        src = ./.;
        excludes = [".lock" ".json" "hardware-configuration.nix"];
        hooks = {
          alejandra.enable = true;
          deadnix.enable = true;
          prettier = {
            enable = true;
            settings = {
              write = true;
              configPath = "./.prettierrc.yaml";
            };
          };
          statix = {
            enable = true;
            # Workaround for https://github.com/cachix/git-hooks.nix/issues/288
            settings.ignore = ["hardware-configuration.nix"];
          };
          stylua.enable = true;
          typos = {
            enable = true;
            settings = {
              write = true;
              configPath = "./.typos.toml";
            };
          };
        };
      };
    });

    devShells = forAllSystems (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      default = pkgs.mkShell {
        inherit (self.checks.${system}.pre-commit-check) shellHook;

        buildInputs = self.checks.${system}.pre-commit-check.enabledPackages;

        nativeBuildInputs = [
          pkgs.alejandra
          pkgs.git
          pkgs.just
        ];

        NIX_CONFIG = "extra-experimental-features = nix-command flakes ca-derivations";
      };
    });

    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    nixosConfigurations = {
      vm1 = lib.nixosSystem {
        specialArgs = {
          inherit inputs outputs vars;
        };
        modules = [
          ./hosts/vm1
        ];
      };

      loki = lib.nixosSystem {
        specialArgs = {
          inherit inputs outputs vars;
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
          ./home/core/nix.nix
        ];
        extraSpecialArgs = {
          inherit inputs outputs vars;
        };
      };
      "rico@todd2" = lib.homeManagerConfiguration {
        modules = [
          ./home/rico/todd2.nix
          ./home/core/nix.nix
        ];
        extraSpecialArgs = {
          inherit inputs outputs vars;
        };
      };
      "rico@vm1" = lib.homeManagerConfiguration {
        modules = [
          ./home/rico/vm1.nix
          ./home/core/nix.nix
        ];
        extraSpecialArgs = {
          inherit inputs outputs vars;
        };
      };
    };
  };
}
