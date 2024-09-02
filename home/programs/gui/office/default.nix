{pkgs, ...}: {
  imports = [
    # FIXME: Include when config is merged from system
    # ./zathura.nix
  ];

  home.packages = with pkgs; [
    libreoffice
    rnote
    xournalpp
  ];
}
