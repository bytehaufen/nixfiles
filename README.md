# My Nix Home Manager configuration

This repository holds my Home Manager configuration for x86_64-linux, currently
transitioning from legacy configurations in $HOME/.config/.

## Prerequisites

Git hook for auto formatting of `.nix` files on commit can be installed with

```shell
./scripts/create-hook-symlink.sh
```

## Enable Nix flakes and command

```shell
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" > ~/.config/nix/nix.conf
```

## Build the Home Manager configuration

- Building and activating via direct Nix command:

  ```shell
  # Build configuration
  nix build ".#homeConfigurations.rico-arch.activationPackage"

  # Activate configuration
  ./result/activate
  ```

- Or using Home Manager's built-in command:

  ```shell
  home-manager switch --flake ".#rico-arch"
  ```

## Shorthands

For frequently used commands like `home-manager switch ...`, utilize _just_ for
simplification. To see all available commands with just, execute:

```shell
just
```
