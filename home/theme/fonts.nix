{
  lib,
  pkgs,
  ...
}: {
  options.fonts.monospace = lib.mkOption {
    default = {
      package = pkgs.jetbrains-mono;
      name = "JetBrains Mono";
      size = 11;
    };
  };
}
