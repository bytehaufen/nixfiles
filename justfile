# Aliases
alias s := home-manager-switch-rico

# List available recipes
default:
  @just --list --list-heading $'Available repo recipes:\n\njust...\n' --list-prefix '...'


# Create symlinks for git-hooks
hooks:
  ./scripts/create-hook-symlink.sh

# Create symlink for home-manager config (needed for use of e.g. `home-manager edit`)
home-manager-link:
  ln -s $(realpath ./home/) ${XDG_CONFIG_HOME}/home-manager

# Create home-manager configuration
home-manager-switch-rico:
  home-manager switch --flake '.#rico@arch'
