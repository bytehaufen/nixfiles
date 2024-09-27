{
  config,
  pkgs,
  ...
}: let
  nixGL = import ../../wrapper/nixGL.nix {inherit config pkgs;};
in {
  programs = {
    neovide = {
      enable = true;
      package = nixGL pkgs.neovide;
      settings = {
        fork = true;
        frame = "full";
        idle = true;
        maximized = false;
        no-multigrid = false;
        srgb = false;
        tabs = true;
        theme = "auto";
        title-hidden = true;
        vsync = true;

        font = {
          normal = [
            "FiraCode Nerd Font"
            "JetBrainsMono Nerd Font"
          ];
          size = 12.0;
        };
      };
    };
  };
}
