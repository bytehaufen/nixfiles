{pkgs, ...}: {
  programs.mpv = {
    enable = true;
    defaultProfiles = ["gpu-hq"];
    scripts = [
      pkgs.mpvScripts.mpris # Control mpv with standard media keys
    ];
    config = {
      keep-open = true;
    };
    bindings = {
      "Alt+RIGHT" = "no-osd cycle-values video-rotate  '90' '180' '270' '0'";
      "Alt+LEFT" = "no-osd cycle-values video-rotate  '270' '180' '90' '0'";
    };
  };
}
