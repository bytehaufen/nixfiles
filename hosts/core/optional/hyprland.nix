{
  pkgs,
  inputs,
  ...
}: {
  programs.hyprland = let
    hyprlandPkg = inputs.hyprland.packages.${pkgs.system};
  in {
    enable = true;
    package = hyprlandPkg.hyprland;
    portalPackage = hyprlandPkg.xdg-desktop-portal-hyprland;
  };
}
