<!-- markdownlint-disable MD033 -->

<h1 align="center">❄️Bytehaufens Nixfiles❄️</h1>

> [!warning]
> This repository is currently under heavy development. So do not use this! 🚧
>
> Currently I am migrating from arch linux to NixOS. So this repository will
> be updated frequently. Many things have to be refactored, are buggy,
> broken, incomplete, whatever. If you have any questions or suggestions,
> feel free to open an issue.

This repository contains my personal NixOS and Home Manager configuration files.

I use [Nix flakes](https://nixos.wiki/wiki/Flakes) for managing the configuration.

## Structure

TBD

## Secrets

TBD

## Applications and tooling I use

|                      | Tool                                                                |
| -------------------- | ------------------------------------------------------------------- |
| Window Manager       | [Hyprland](https://hyprland.org/)                                   |
| Terminal Emulator    | [Kitty](https://sw.kovidgoyal.net/kitty/)                           |
| Shell                | [Zsh](https://www.zsh.org/)                                         |
| PDF Viewer           | [Zathura](https://pwmt.org/projects/zathura/)                       |
| Editor               | [Neovim](https://neovim.io/) \| [Eclipse](https://www.eclipse.org/) |
| Terminal Multiplexer | [Tmux](https://github.com/tmux/tmux/)                               |
| File Manager         | [Yazi](https://github.com/sxyazi/yazi) \| Nautilus                  |

## How to use

TBD

## Prerequisites

> TODO: Replace by nix's hook.

Git hook for auto formatting of `.nix` files on commit can be installed with

```shell
./scripts/create-hook-symlink.sh
```

<!-- Deprecated start --->

## Build the Home Manager configuration

- Building and activating via direct Nix command:

  ```shell
  # Build configuration
  nix build ".#homeConfigurations.rico@arch.activationPackage"

  # Activate configuration
  ./result/activate
  ```

- Or using Home Manager's built-in command:

  ```shell
  home-manager switch --flake ".#rico@arch"
  ```

## Shorthands

For frequently used commands like `home-manager switch ...`, utilize _just_ for
simplification. To see all available commands with just, execute:

```shell
just
```

<!-- Deprecated end --->

## Special Thanks

To ryan4yin for his great book [NixOS & Flakes Book](https://nixos-and-flakes.thiscute.world),
that helped me a lot to get started with NixOS and flakes and to flatten the
steep learning curve.

To Folke Lemaitre for his awesome [neovim](https://github.com/neovim/neovim)
plugin manager [💤 lazy.nvim](https://github.com/folke/lazy.nvim) and the
corresponding neovim setup [LazyVim](https://github.com/folke/lazy.nvim)

Dotfiles that inspired me:

- [ryan4yin](https://github.com/ryan4yin/nix-config)
- [Misterio77](https://github.com/Misterio77/nix-config)
- [fufexan](https://github.com/fufexan/dotfiles)

and many many others ... ❤️
