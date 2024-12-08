{pkgs, ...}: let
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
      # (nerdfonts.override {
      #   fonts = [
      #     # Symbols icon only
      #     "NerdFontsSymbolsOnly"
      #     "FiraCode"
      #     "JetBrainsMono"
      #   ];
      # })
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
}
