{pkgs, ...}: {
  home.packages = with pkgs; [
    libreoffice
    obsidian # Note-taking app
    onlyoffice-bin # Office alternative
    rnote
    okular # PDF View and annotator
  ];
}
