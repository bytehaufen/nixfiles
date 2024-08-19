{
  pkgs,
  config,
  ...
}: let
  nixGL = import ../../wrapper/nixGL.nix {inherit pkgs config;};
in {
  programs.kitty = {
    enable = true;
    package = nixGL pkgs.kitty;
    keybindings = {
      "ctrl+shift+v" = "paste_from_clipboard";
      "ctrl+v" = "paste_from_clipboard";
      "ctrl+shift+c" = "copy_to_clipboard";
      "ctrl+shift+plus" = "change_font_size all +2.0";
      "ctrl+shift+minus" = "change_font_size all -2.0";
      "ctrl+shift+0" = "change_font_size all 0";
      "ctrl+shift+u" = "kitten unicode_input";
    };
    settings = {
      # Font settings
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";

      scrollback_lines = 10000;
      open_url_with = "qutebrowser";
      confirm_os_window_close = 0;
      window_padding_width = 5;
      copy_on_select = true;
      enable_audio_bell = false;
      allow_remote_control = true;
      listen_on = "unix:@mykitty";
      close_on_child_death = true;
    };
  };
}
