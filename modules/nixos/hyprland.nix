{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.opts.nixos.gui.enable {
    programs.hyprland = {
      enable = true;
    };
  };
}
