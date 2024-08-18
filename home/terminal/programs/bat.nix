{...}: {
  programs.bat = {
    enable = true;
    config = {
      pager = "less -FR";
      tabs = "2";
    };
  };
  home.sessionVariables = {
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    MANROFFOPT = "-c";
  };
}
