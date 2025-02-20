{config, ...}: {
  services.mako = let
    colors = config.colorScheme.palette;
  in {
    enable = true;
    iconPath = "${config.gtk.iconTheme.package}/share/icons/Papirus-Dark";
    font = "${config.gtk.font.name} 12";
    padding = "10,20";
    anchor = "top-right";
    width = 400;
    height = 150;
    borderSize = 2;
    defaultTimeout = 12000;
    backgroundColor = "#${colors.base00}dd";
    borderColor = "#${colors.base0A}dd";
    textColor = "#${colors.base05}dd";
    borderRadius = 5;
    layer = "overlay";
    extraConfig = ''
      max-history=50
    '';
  };
}
