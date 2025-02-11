# List available recipes
default:
  @just --list

#################
# nix           #
#################

# Create hardware configuration
[group('nix')]
nixos-gen HOSTNAME *ARGS:
  nixos-generate-config --dir hosts/{{HOSTNAME}} {{ARGS}}

# Build and switch NixOS configuration
[group('nix')]
nixos-switch HOSTNAME *ARGS: clean
  sudo nixos-rebuild switch --flake '.#{{HOSTNAME}}' {{ARGS}}

# Build NixOS configuration
[group('nix')]
nixos-build HOSTNAME *ARGS:
  sudo nixos-rebuild build --flake '.#{{HOSTNAME}}' {{ARGS}}

# Create home-manager configuration
[group('nix')]
hm-switch USER *ARGS: clean
  home-manager switch --flake '.#{{USER}}' {{ARGS}} --extra-experimental-features 'nix-command flakes ca-derivations'

# Build home-manager configuration
[group('nix')]
hm-build USER *ARGS:
  home-manager build --flake '.#{{USER}}' {{ARGS}} --extra-experimental-features 'nix-command flakes ca-derivations'

# Update flake dependencies
[group('nix')]
update *ARGS:
  nix flake update {{ARGS}}

# Open nix shell with the flake
[group('nix')]
repl:
  nix repl -f flake:nixpkgs

# Enter shell session with all necessary tools for this flake
[group('nix')]
shell:
  nix shell nixpkgs#git nixpkgs#neovim

# Garbage collect all unused nix store entries
[group('nix')]
gc:
  sudo nix-collect-garbage --delete-older-than 7d
  nix-collect-garbage --delete-older-than 7d

# Format nix files
[group('nix')]
fmt:
  nix fmt .

# Check nix flake
[group('nix')]
check:
  nix flake check

# Remove build output link (no garbage collection)
[group('nix')]
clean:
  rm -rf ./result

#################
# neovim        #
#################

# Purge neovim configuration
[group('neovim')]
purge-nvim:
  rm -rf "$HOME/.local/state/nvim/"
  rm -rf "$HOME/.local/share/nvim/"
  rm -rf "$HOME/.cache/nvim/"

#################
# MISCELLANEOUS #
#################

# List all PATH entries, one per line
[group('misc')]
get-path:
  echo $PATH | tr ':' '\n'

# Show the environment variables of a process by PID
[group('misc')]
penvof pid:
  sudo cat /proc/{{pid}}/environ | tr ' ' '\n'

# Remove all reflog entries and prune unreachable objects
[group('git')]
ggc:
  git reflog expire --expire-unreachable=now --all
  git gc --prune=now

# List all inactive systemd services
[linux]
[group('services')]
list-inactive:
  systemctl list-units -all --state=inactive

# List all failed systemd services
[linux]
[group('services')]
list-failed:
  systemctl list-units -all --state=failed
