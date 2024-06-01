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
    #FIXME: Fix for non gnome, need to filter programmatically
    environment = {"LIBGL_ALWAYS_SOFTWARE" = "1";};
    # Set by stylix
    # font = {
    #     package = pkgs.fira-code;
    #     name = "Fira Code";
    #     size = 12;
    #   };
  };
}
