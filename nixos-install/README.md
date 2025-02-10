# Install NixOS

The installation of NixOS onto a new host can be done with this script [install.sh](install.sh).

It uses [nixos-anywhere](https://github.com/nix-community/nixos-anywhere/) for remote installation
and wipes the entire target system, partitioning the disks according to the defined disko-config.
The build is done on the local machine.

This script

- Creates a new SSH host key
- Provides instructions for updating the secrets repository
- Provides instructions for updating this repository
- Installs NixOS on the target system

## How to

- Boot from NixOS (minimal) installer
- Enable wifi if necessary:

  ```bash
  # Start wpa_supplicant
  sudo systemctl start wpa_supplicant
  # Enter the cli
  wpa_cli

  # Setup wifi connection in the cli
  > add_network
  > set_network 0 ssid "myhomenetwork"
  > set_network 0 psk "mypassword"
  > enable_network 0
  ```

- Set password:

  ```bash
  passwd
  ```
