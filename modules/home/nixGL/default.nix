{
  inputs,
  lib,
  config,
  ...
}: {
  options.opts.home.nixGL = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable NixGL for the system";
    };
  };

  config = lib.mkIf config.opts.home.nixGL.enable {
    nixGL = {
      inherit (inputs.nixGL) packages;
      defaultWrapper = "mesa";
      installScripts = ["mesa"];
      vulkan.enable = false;
    };
  };
}
