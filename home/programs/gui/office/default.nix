{pkgs, ...}: {
  home.packages = with pkgs; [
    libreoffice
    rnote
    xournalpp
  ];
}
