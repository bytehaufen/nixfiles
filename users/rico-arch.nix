{
  pkgs,
  system,
  ...
}: let
  # List of themes: [base16-schemes](https://github.com/tinted-theming/base16-schemes)
  # Favorites
  # theme = "onedark";
  theme = "gruvbox-dark-hard";

  # Wallpaper
  image = ../wallpapers/black_arch.png;
in {
  imports = [../services ../programs];

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
    username = "rico";
    homeDirectory = "/home/rico/";

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
