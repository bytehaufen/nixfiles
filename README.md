# Nix configuration

## Home Manager

This contains my home manager configuration for `x86_64-linux` which is at the
moment under construction (migration from `$HOME/.config/` configuration).
I have two machines with two different usernames sharing one configuration.

### Build configuration

Build the configuration with neither

- ```shell
  # Build configuration
  nix build ".#homeConfigurations.rico@arch.activationPackage"

  # Activate configuration
  ./result/activate
  ```

or

- ```shell
  home-manager switch --flake ".#rico@arch"
  ```
