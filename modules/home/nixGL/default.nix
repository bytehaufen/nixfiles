{
  inputs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.opts.home.nixGL.enable {
    nixGL = {
      inherit (inputs.nixGL) packages;
      defaultWrapper = "mesa";
      installScripts = ["mesa"];
      vulkan.enable = false;
    };
  };
}
