{
  pkgs,
  inputs,
  ...
}: let
  tokyo-night-gtk = pkgs.tokyo-night-gtk.override {
    colorVariants = [
      "dark"
    ];
    sizeVariants = [
      "standard"
    ];
    themeVariants = [
      "default"
    ];
    tweakVariants = [
      "moon"
      "storm"
    ];
    iconVariants = [
      "Dark"
    ];
  };
in {
  # Default installed fonts
  home = {
    packages = with pkgs; [
      dejavu_fonts
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      liberation_ttf
      nerd-fonts.symbols-only
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
    ];

    pointerCursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
      gtk.enable = true;
    };
  };

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = [
        "DejaVu Serif"
        "Noto Color Emoji"
      ];
      sansSerif = [
        "DejaVu Sans"
        "Noto Color Emoji"
      ];
      monospace = [
        "FiraCode Nerd Font"
        "Noto Color Emoji"
      ];

      emoji = [
        "Noto Color Emoji"
      ];
    };
  };

  gtk = {
    enable = true;

    font.name = "DejaVu Sans";

    theme = {
      name = "Tokyonight-Dark-Storm";
      package = tokyo-night-gtk;
    };

    iconTheme = {
      name = "Tokyonight-Dark";
      package = tokyo-night-gtk;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
  # Access colors by e.g.: `config.colorScheme.palette.base05`
  colorScheme = inputs.nix-colors.colorSchemes.tokyo-night-storm;
  # Color reference for Tolkyo Night Storm:
  # base00 = "#24283B"
  # base01 = "#16161E"
  # base02 = "#343A52"
  # base03 = "#444B6A"
  # base04 = "#787C99"
  # base05 = "#A9B1D6"
  # base06 = "#CBCCD1"
  # base07 = "#D5D6DB"
  # base08 = "#C0CAF5"
  # base09 = "#A9B1D6"
  # base0A = "#0DB9D7"
  # base0B = "#9ECE6A"
  # base0C = "#B4F9F8"
  # base0D = "#2AC3DE"
  # base0E = "#BB9AF7"
  # base0F = "#F7768E"
}
