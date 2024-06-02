{
  pkgs,
  theme,
  image,
}: {
  inherit image;

  autoEnable = false;

  # Set scheme to prevent auto generating
  base16Scheme = "${pkgs.base16-schemes}/share/themes/${theme}.yaml";

  targets = {
    # As example for disabling
    rofi.enable = true;
    waybar.enable = true;
    dunst.enable = true;
    kitty.enable = true;
    bat.enable = true;
    lazygit.enable = true;
    btop.enable = true;
    hyprland.enable = true;
    qutebrowser.enable = true;

    nixvim.transparent_bg.main = true;
    nixvim.transparent_bg.sign_column = true;
  };

  polarity = "dark"; # [ "dark" | "light" ]

  opacity = {
    terminal = 1.0;
    applications = 1.0;
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
