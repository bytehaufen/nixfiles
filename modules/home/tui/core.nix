{pkgs, ...}: {
  home.packages = with pkgs; [
    # Archives
    unrar
    unzip
    zip

    # Notification
    libnotify

    # Utils
    du-dust
    duf
    fd
    file
  ];
}
