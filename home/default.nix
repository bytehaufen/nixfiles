{inputs, ...}: {
  imports = [
    inputs.tailray.homeManagerModules.default
  ];

  programs.home-manager.enable = true;

  home = {
    username = "rico";
    homeDirectory = "/home/rico";
    stateVersion = "23.11";
    extraOutputsToInstall = ["doc" "devdoc"];
    language.base = "en_US.UTF-8";
  };
}
