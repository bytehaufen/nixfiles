{...}: {
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
  };
  home.shellAliases = {
    zr = "zellij run --";
    zrf = "zellij run --floating --";
    ze = "zellij edit";
    zef = "zellij edit --floating";
  };
}
