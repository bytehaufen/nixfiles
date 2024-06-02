# Aliases
alias sr := home-manager-switch-rico
alias br := home-manager-build-rico

# List available recipes
default:
  @just --list --list-heading $'Available repo recipes:\n\njust...\n' --list-prefix '...'


# Create symlinks for git-hooks
hooks:
  ./scripts/create-hook-symlink.sh

# Create home-manager configuration
home-manager-switch-rico *ARGS:
  home-manager switch --flake '.#rico-arch' {{ARGS}} --extra-experimental-features nix-command --extra-experimental-features flakes

# Build home-manager configuration
home-manager-build-rico *ARGS:
  home-manager build --flake '.#rico-arch' {{ARGS}} --extra-experimental-features nix-command --extra-experimental-features flakes

# Update flake dependencies
up:
  nix flake update

# Open nix shell with the flake
repl:
  nix repl -f flake:nixpkgs

# Garbage collect all unused nix store entries
gc:
  nix-collect-garbage --delete-old

# Format nix files in this repo
fmt:
  nix fmt
