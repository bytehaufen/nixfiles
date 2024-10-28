{
  inputs,
  lib,
  ...
}: {
  nixGL = {
    inherit (inputs.nixGL) packages;
    defaultWrapper = lib.mkDefault "mesa"; # [ "mesa" | "mesaPrime" |  "nvidia" | "nvidiaPrime"]
    vulkan.enable = lib.mkDefault false; # NOTE: When activated, glibc versions mismatch
  };
}
