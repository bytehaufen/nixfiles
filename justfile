# List available recipes
default:
  @just --list

# Create symlinks for git-hooks # TODO: Move hook creating to nix
[group('misc')]
hooks:
  ./scripts/create-hook-symlink.sh

#################
# nix           #
#################

# Create home-manager configuration
[group('nix')]
switch USER *ARGS: clean fmt check 
  home-manager switch --flake '.#{{USER}}' {{ARGS}} --extra-experimental-features nix-command --extra-experimental-features flakes
  systemctl --user restart ags 2> /dev/null

# Build home-manager configuration
[group('nix')]
build USER *ARGS: fmt check
  home-manager build --flake '.#{{USER}}' {{ARGS}} --extra-experimental-features nix-command --extra-experimental-features flakes

[group('nix')]
build-activate USER *ARGS: fmt check
  home-manager build --flake '.#{{USER}}' {{ARGS}} --extra-experimental-features nix-command --extra-experimental-features flakes
  result/activate
  systemctl --user restart ags 2> /dev/null

# Update flake dependencies
[group('nix')]
update:
  nix flake update

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
  nix fmt

# Check nix flake
[group('nix')]
check:
  statix check
  deadnix -f .
  nix flake check

# Remove build output link (no garbarge collection)
[group('nix')]
clean:
  rm -rf ./result

#################
# neovim        #
#################

# Copy flake neovim configuration to $HOME/.config
[group('neovim')]
test-nvim: clean-nvim
  rsync -avz --copy-links --chmod=D2755,F444 home/programs/tui/neovim/nvim "$HOME/.config/"

# Clean neovim configuration
[group('neovim')]
clean-nvim:
  rm -rf "$HOME/.config/nvim"

# Purge neovim configuration
[group('neovim')]
purge-nvim: clean-nvim
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
