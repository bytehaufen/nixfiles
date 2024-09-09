{
  lib,
  pkgs,
  ...
}: {
  # TODO: Use, merge or remove with theme
  options.fonts.monospace = lib.mkOption {
    default = {
      package = pkgs.jetbrains-mono;
      name = "JetBrains Mono";
      size = 11;
    };
  };
}
