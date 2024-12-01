# Install NixOS

The installation of NixOS onto a new host can be done with this script [install.sh](install.sh).

It uses [nixos-anywhere](https://github.com/nix-community/nixos-anywhere/) for
remote installation and wipes the entire target system, partitioning the disks
according to the defined disko-config.
The build is done on the local machine.

This script

- Creates a new SSH host key
- Provides instructions for updating the secrets repository
- Provides instructions for updating this repository
- Installs NixOS on the target system
