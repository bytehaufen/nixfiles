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
    defaultWrapper = lib.mkOption {
      type = lib.types.enum (builtins.attrNames config.lib.nixGL.wrappers);
      default = "mesa";
    };
    vulkan.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable Vulkan support";
    };
  };

  config = lib.mkIf config.opts.nixGL.enable {
    nixGL = {
      inherit (inputs.nixGL) packages;
      inherit (config.opts.nixGL) defaultWrapper vulkan;
    };
  };
}
