{pkgs, ...}: let
  fonts = {
    serif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Serif";
    };

    sansSerif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans";
    };
    monospace = {
      package = pkgs.jetbrains-mono;
      name = "JetBrains Mono";
    };

    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };
  };

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
  home = {
    pointerCursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
      gtk.enable = true;
    };
  };

  fonts.fontconfig.defaultFonts = fonts;
  gtk = {
    enable = true;

    font = {
      inherit (fonts.sansSerif) name;
    };

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
