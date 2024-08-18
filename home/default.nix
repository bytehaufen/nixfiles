{
  lib,
  self,
  inputs,
  ...
}: {
  imports = [
    ./terminal
    inputs.tailray.homeManagerModules.default
  ];

  programs.home-manager.enable = true;
  home.language.base = "en_US.UTF-8";

  home = {
    username = "rico";
    homeDirectory = "/home/rico";
    stateVersion = "23.11";
    extraOutputsToInstall = ["doc" "devdoc"];
  };
}
