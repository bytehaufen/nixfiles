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

      background_opacity = "0.0";

      # Colors
      background = "#1a1b26";
      foreground = "#c0caf5";
      selection_background = "#283457";
      selection_foreground = "#c0caf5";
      url_color = "#73daca";
      cursor = "#c0caf5";
      cursor_text_color = "#1a1b26";
      # Tabs
      active_tab_background = "#7aa2f7";
      active_tab_foreground = "#16161e";
      inactive_tab_background = "#292e42";
      inactive_tab_foreground = "#545c7e";
      # Windows
      active_border_color = "#7aa2f7";
      inactive_border_color = "#292e42";
      # normal
      color0 = "#15161e";
      color1 = "#f7768e";
      color2 = "#9ece6a";
      color3 = "#e0af68";
      color4 = "#7aa2f7";
      color5 = "#bb9af7";
      color6 = "#7dcfff";
      color7 = "#a9b1d6";
      # bright
      color8 = "#414868";
      color9 = "#f7768e";
      color10 = "#9ece6a";
      color11 = "#e0af68";
      color12 = "#7aa2f7";
      color13 = "#bb9af7";
      color14 = "#7dcfff";
      color15 = "#c0caf5";
      # extended colors
      color16 = "#ff9e64";
      color17 = "#db4b4b";
    };
  };
}
