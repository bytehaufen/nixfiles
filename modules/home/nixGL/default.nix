{
  inputs,
  lib,
  config,
  ...
}: {
  options.opts.nixGL = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable NixGL for the system";
    };
  };

  config = lib.mkIf config.opts.nixGL.enable {
    nixGL = {
      inherit (inputs.nixGL) packages;
      defaultWrapper = "mesa";
      installScripts = ["mesa"];
      vulkan.enable = false;
    };
  };
}
