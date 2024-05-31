{
  pkgs,
  theme,
  image,
}: {
  inherit image;

  # Set scheme to prevent auto generating
  base16Scheme = "${pkgs.base16-schemes}/share/themes/${theme}.yaml";

  targets = {
    # As example for disabling
    # rofi.enable = false;
    # waybar.enable = false;
    dunst.enable = false;

    nixvim.transparent_bg.main = true;
    nixvim.transparent_bg.sign_column = true;
  };

  polarity = "dark"; # [ "dark" | "light" ]

  opacity = {
    terminal = 0.0;
    applications = 0.0;
  };

  cursor = {
    package = pkgs.bibata-cursors;
    # name = "Bibata-Modern-Ice";
    name = "Bibata-Modern-Classic";
    size = 24;
  };

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
      package = pkgs.fira-code;
      name = "Fira Code";
    };

    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };
  };
}
