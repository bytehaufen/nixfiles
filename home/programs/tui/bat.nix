{pkgs, ...}: {
  programs.bat = {
    enable = true;
    config = {
      pager = "less -FR";
      tabs = "2";
    };
    extraPackages = with pkgs.bat-extras; [batdiff batwatch];
  };
}
