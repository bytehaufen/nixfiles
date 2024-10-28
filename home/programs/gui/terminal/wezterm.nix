{
  pkgs,
  config,
  ...
}: {
  programs.wezterm = {
    enable = true;
    package = config.lib.nixGL.wrap pkgs.wezterm;
    extraConfig = ''
      local wezterm = require ("wezterm")

      -- wezterm.gui is not available to the mux server, so take care to
      -- do something reasonable when this config is evaluated by the mux
      function get_appearance()
        if wezterm.gui then
          return wezterm.gui.get_appearance()
        end
        return 'Dark'
      end

      function scheme_for_appearance(appearance)
        if appearance:find 'Dark' then
          return 'Catppuccin Mocha'
        else
          return 'Catppuccin Latte'
        end
      end

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
        enable_wayland = false,
        check_for_updates = false,
        color_scheme = scheme_for_appearance(get_appearance()),
        default_cursor_style = "SteadyBar",
        automatically_reload_config = true,
        hide_tab_bar_if_only_one_tab = true,
        window_close_confirmation = "NeverPrompt",

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
      }
    '';
  };
}
