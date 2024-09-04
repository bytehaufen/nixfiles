{pkgs, ...}: let
  # List of themes: [base16-schemes](https://github.com/tinted-theming/base16-schemes)
  # Favorites
  # theme = "onedark";
  # theme = "gruvbox-dark-hard";
  # theme = "catppuccin-macchiato";
  # theme = "catppuccin-mocha";
  # theme = "tokyo-night-dark";
  theme = "tokyo-night-storm";
  wallpaper = ../../wallpaper/black_arch.png;
  ## Palette preview: [palette.html](~/.config/stylix/palette.html)
in {
  stylix = {
    enable = true;
    image = wallpaper;

    autoEnable = false;

    # Set scheme to prevent auto generating
    base16Scheme = "${pkgs.base16-schemes}/share/themes/${theme}.yaml";

    targets = {
      # Enabled
      hyprland.enable = true;
      zellij.enable = true;
    };

    polarity = "dark"; # [ "dark" | "light" ]

    opacity = {
      terminal = 0.3;
      applications = 0.3;
    };

    cursor = {
      package = pkgs.bibata-cursors;
      # name = "Bibata-Modern-Ice";
      name = "Bibata-Modern-Classic";
      size = 24;
    };

    fonts = {
      sizes = {
        terminal = 11;
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };

      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      monospace = {
        # package = pkgs.fira-code;
        # name = "Fira Code";
        package = pkgs.jetbrains-mono;
        name = "JetBrains Mono";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
  };
}
