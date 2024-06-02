{
  pkgs,
  config,
  ...
}: let
  nixGL = import ../../../wrapper/nixGL.nix {inherit pkgs config;};
in {
  programs.kitty = {
    enable = true;
    package = nixGL pkgs.kitty;
    # Set by stylix
    # font = {
    #     package = pkgs.fira-code;
    #     name = "Fira Code";
    #     size = 12;
    #   };
  };
}
