{ config, pkgs, programs, ... }: {
  programs.nnn = {
    enable = true;
    package = pkgs.stdenv.mkDerivation {
      name = "nnn-custom";
      buildInputs = [ pkgs.makeWrapper pkgs.nnn ];

      dontUnpack = true;

      installPhase = ''
        mkdir -p $out/bin

        makeWrapper ${pkgs.nnn.override { withNerdIcons = true; }}/bin/nnn $out/bin/nnn \
          --set NNN_FIFO "/tmp/nnn.fifo" \
          --set NNN_PLUG 'c:fzcd;j:autojump;l:gitlog;p:preview-tui;g:grep;' \
          --set NNN_BMS 'd:$HOME/Documents;D:$HOME/Downloads;p:$HOME/Pictures;v:$HOME/Videos' \
      '';
    };

    # TODO : Check necessary packages

#     # TODO : Add custom plugins

  };
}
