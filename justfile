# Aliases
alias sr := home-manager-switch-rico

# List available recipes
default:
  @just --list --list-heading $'Available repo recipes:\n\njust...\n' --list-prefix '...'


# Create symlinks for git-hooks
hooks:
  ./scripts/create-hook-symlink.sh

# Create home-manager configuration
home-manager-switch-rico:
  home-manager switch --flake '.#rico-arch'

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
