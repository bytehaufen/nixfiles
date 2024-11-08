{pkgs, ...}: {
  home.packages = with pkgs; [
    ## Tex
    pandoc
  ];
}
