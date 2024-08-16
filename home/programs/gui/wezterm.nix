{
  pkgs,
  config,
  ...
}: let
  nixGL = import ../../wrapper/nixGL.nix {inherit pkgs config;};
in {
  programs.wezterm = {
    enable = true;
    package = nixGL pkgs.wezterm;
    extraConfig = ''
      local wezterm = require ("wezterm")


       return {

         enable_scroll_bar = true,
         enable_tab_bar = true,
         scrollback_lines = 10000,
         window_padding = {
           left = 25,
           right = 25,
           top = 25,
           bottom = 25,
         },
         enable_wayland = true,
         check_for_updates = false,
         default_cursor_style = "SteadyBar",
         automatically_reload_config = true,

         disable_default_key_bindings = true,
         keys = {
           {
             key = "v",
             mods = "CTRL|SHIFT",
             action = wezterm.action({ PasteFrom = "Clipboard" }),
           },
           {
             key = "c",
             mods = "CTRL|SHIFT",
             action = wezterm.action({ CopyTo = "ClipboardAndPrimarySelection" }),
           },
           },
             window_close_confirmation = "NeverPrompt",
           }
    '';
  };
}
