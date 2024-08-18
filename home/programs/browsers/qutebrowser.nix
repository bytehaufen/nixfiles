{
  pkgs,
  config,
  ...
}: let
  nixGL = import ../../../wrapper/nixGL.nix {inherit pkgs config;};
in {
  programs.qutebrowser = {
    enable = true;
    package = nixGL pkgs.qutebrowser;
  };
}
