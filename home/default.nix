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
    language = {
      base = "en_US.UTF-8";

      address = "de_DE.UTF-8";
      measurement = "de_DE.UTF-8";
      monetary = "de_DE.UTF-8";
      name = "de_DE.UTF-8";
      numeric = "de_DE.UTF-8";
      paper = "de_DE.UTF-8";
      telephone = "de_DE.UTF-8";
    };
  };
  news.display = "silent";
  manual.manpages.enable = true;
}
