# List available recipes
default:
  @just --list --list-heading $'Available repo recipes:\n\njust...\n' --list-prefix '...'


# Create symlinks for git-hooks
hooks:
  ./scripts/create-hook-symlink.sh

# Create home-manager configuration
switch USER *ARGS: clean lint check
  home-manager switch --flake '.#{{USER}}' {{ARGS}} --extra-experimental-features nix-command --extra-experimental-features flakes

# Build home-manager configuration
build USER *ARGS: lint check
  home-manager build --flake '.#{{USER}}' {{ARGS}} --extra-experimental-features nix-command --extra-experimental-features flakes

# Update flake dependencies
update:
  nix flake update

# Open nix shell with the flake
repl:
  nix repl -f flake:nixpkgs

# Garbage collect all unused nix store entries
gc:
  nix-collect-garbage --delete-old

# Format nix files in this repo
lint:
  nix fmt

# Check nix flake
check:
  nix flake check

# Remove build output link (no garbarge collection)
clean:
  rm -rf ./result
