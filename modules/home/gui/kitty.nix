{
  pkgs,
  config,
  ...
}: {
  programs.kitty = {
    enable = true;
    package = config.lib.nixGL.wrap pkgs.kitty;
    keybindings = {
      "ctrl+shift+v" = "paste_from_clipboard";
      "ctrl+v" = "paste_from_clipboard";
      "ctrl+shift+c" = "copy_to_clipboard";
      "ctrl+shift+plus" = "change_font_size all +2.0";
      "ctrl+shift+minus" = "change_font_size all -2.0";
      "ctrl+shift+0" = "change_font_size all 0";
      "ctrl+shift+u" = "kitten unicode_input";
    };

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
    };

    themeFile = "tokyo_night_night";

    settings = {
      scrollback_lines = 10000;
      confirm_os_window_close = 0;
      window_padding_width = 5;
      copy_on_select = true;
      enable_audio_bell = false;
      allow_remote_control = true;
      listen_on = "unix:@mykitty";
      close_on_child_death = true;

      background_opacity = 1.0;
    };
  };

  home.packages = [
    # used by `gio open` and xdg-gtk
    (pkgs.writeShellScriptBin "xdg-terminal-exec" ''
      kitty "$@"
    '')
    pkgs.xdg-utils
  ];
}
