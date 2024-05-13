{
  pkgs,
  system,
  config,
  ...
}: let
  # List of themes: [base16-schemes](https://github.com/tinted-theming/base16-schemes)
  # Favorites
  # theme = "onedark";
  # theme = "gruvbox-dark-hard";
  theme = "tokyo-night-dark";

  # Wallpaper
  image = ../wallpapers/black_arch.png;
in {
  imports = [../services ../programs/cli ../programs/gui];

  programs.home-manager.enable = true;

  # Stylix config
  ## Palette preview: [palette.html](~/.config/stylix/palette.html)
  stylix = import ./common/stylix.nix {inherit pkgs theme image;};

  # Nixpkgs config
  nixpkgs = {
    config = {
      inherit system;

      allowUnfree = true;
      allowUnsupportedSystem = true;
      experimental-features = "nix-command flakes";
    };
  };

  home = {
    homeDirectory = "/home/${config.home.username}";

    stateVersion = "23.11";

    sessionVariables = {
      EDITOR = "nvim";
    };

    packages = import ../packages {inherit pkgs;};

    shellAliases = {
      # FIXME: not working
      reload-home-manager-config = "home-manager switch --flake ${builtins.toString ./.}";
    };
  };
}
