{pkgs, ...}: {
  imports = [
    ./zathura.nix
  ];

  home.packages = with pkgs; [
    libreoffice
    rnote
    xournalpp
  ];
}
