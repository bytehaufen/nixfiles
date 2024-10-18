{pkgs, ...}: {
  home.packages = with pkgs; [
    # MS Office alternatives
    onlyoffice-bin
    libreoffice

    # PDF Viewer
    okular

    # Note-taking apss
    obsidian
    rnote
  ];
}
