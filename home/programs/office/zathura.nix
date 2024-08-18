{pkgs, ...}: let
  nixGl = import ../../wrapper/nixGL.nix;
in {
  programs.zathura = {
    enable = true;
    package = nixGl pkgs.zathura;
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
