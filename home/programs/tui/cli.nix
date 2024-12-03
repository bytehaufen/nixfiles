{pkgs, ...}: {
  home.packages = with pkgs; [
    # archives
    zip
    unzip
    unrar

    # misc
    libnotify

    # utils
    du-dust
    duf
    fd
    file
    jaq
  ];

  programs = {
    eza.enable = true;
  };
}
