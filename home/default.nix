{system, ...}: let
  # List of themes: [base16-schemes](https://github.com/tinted-theming/base16-schemes)
  # Favorites
  # theme = "onedark";
  # theme = "gruvbox-dark-hard";
  # theme = "tokyo-night-dark";
  # theme = "catppuccin-macchiato";
  theme = "catppuccin-mocha";
  wallpaper = ../wallpapers/black_arch.png;
in {
  inherit theme wallpaper;

  imports = [./services ./programs ./modules/theme];

  programs.home-manager.enable = true;
  home.language.base = "en_US.UTF-8";

  # Nixpkgs config
  nixpkgs = {
    config = {
      inherit system;

      allowUnfree = true;
      allowUnsupportedSystem = true;
      experimental-features = "nix-command flakes";
    };
  };
  nix = {
    gc = {
      automatic = true;
      # Change how often the garbage collector runs (default: weekly)
      # frequency = "monthly";
    };
  };
  home = {
    sessionVariables = {
      EDITOR = "nvim";
      XDG_DATA_DIRS = "$HOME/.nix-profile/share:$XDG_DATA_DIRS";
    };
  };
}
