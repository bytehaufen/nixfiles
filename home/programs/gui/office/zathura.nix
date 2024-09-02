{
  config,
  pkgs,
  ...
}: let
  nixGL = import ../../wrapper/nixGL.nix {inherit pkgs config;};
in {
  programs.zathura = {
    enable = true;
    package = nixGL pkgs.zathura;
    options = {
      selection-notification = true;

      selection-clipboard = "clipboard";
      adjust-open = "best-fit";
      pages-per-row = "1";
      scroll-page-aware = "true";
      scroll-full-overlap = "0.01";
      scroll-step = "100";
      zoom-min = "10";
    };
  };
}
