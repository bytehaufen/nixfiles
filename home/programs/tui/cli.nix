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

    readline = {
      enable = true;
      # Example how to set keybindings in inserts and command mode. Note that I'm ctrl-l to move in tmux terminal
      # so doesn't work there.
      extraConfig = ''
        set editing-mode vi
        $if mode=vi
          set keymap vi-command
          Control-l: clear-screen
          set keymap vi-insert
          Control-l: clear-screen
        $endif
      '';
    };
  };
}
