{inputs, ...}: {
  imports = [
    inputs.tailray.homeManagerModules.default
  ];

  programs.home-manager.enable = true;

  home = {
    username = "rico";
    homeDirectory = "/home/rico";
    stateVersion = "24.11";
    extraOutputsToInstall = ["doc" "devdoc"];
    language.base = "en_US.UTF-8";
  };
  news.display = "silent";
  manual.manpages.enable = true;
}
