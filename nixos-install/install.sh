#!/usr/bin/env bash

# This script installs NixOS to a remote host with our secrets.

# New host information
username='rico'
hostname='loki'

# SSH target
target="nixos@192.168.178.97"
target_port="22"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Create a temporary directory
temp=$(mktemp -d)

# Function to cleanup temporary directory on exit
cleanup() {
  rm -rf "$temp"
}
trap cleanup EXIT

# Create the directory where sshd expects to find the host keys
install -d -m755 "$temp/etc/ssh"

# Create a host key for the new system
ssh-keygen -t ed25519 -a 256 -C "${username}@${hostname}" -f "$temp/etc/ssh/ssh_host_ed25519_key"

# Add the key to the secrets repo
echo
echo -e "${YELLOW}Add new ssh host key to the hosts of secrets repo and reencrypt, commit and push:"
echo -e "${BLUE}Key:"
echo -e "    ${GREEN}$(cat "$temp/etc/ssh/ssh_host_ed25519_key.pub")"
echo
echo -e "${YELLOW}Execute:"
echo -e "    ${BLUE}cd ~/nix-secrets && \ "
echo -e "    vim secrets.nix && \ "
echo -e "    sudo /nix/var/nix/profiles/default/bin/nix run \"github:/yaxitech/ragenix\" -- -r -i /etc/ssh/ssh_host_ed25519_key && \ "
echo -e "    git commit -am \"feat: Add new host\" && \ "
echo -e "    git push${NC}"
echo
read -r -p "Type 'go' to continue: " input
while [ "$input" != "go" ]; do
  read -r -p "Type 'go' to continue: " input
done

# Update nix-config repo
echo
echo -e "${YELLOW}Update nix-config according to added host key:"
echo
echo -e "${YELLOW}Execute:"
echo -e "    ${BLUE}cd ~/nix-config && \ "
echo -e "    just update secrets && \ "
echo -e "    git add flake.lock && \ "
echo -e "    git commit -m \"feat: Update secrets\" && \ "
echo -e "    git push${NC}"
echo
read -r -p "Type 'go' to continue: " input
while [ "$input" != "go" ]; do
  read -r -p "Type 'go' to continue: " input
done

# Install NixOS to the host system with our secrets, a new hardware-configuration.nix will be generated
nix run 'nixpkgs#nixos-anywhere' -- --extra-files "$temp" --copy-host-keys --flake ".#${hostname}" --generate-hardware-config nixos-generate-config hosts/${hostname}/hardware-configuration.nix ${target} -p ${target_port}
