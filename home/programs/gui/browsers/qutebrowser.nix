{
  pkgs,
  config,
  ...
}: let
  nixGL = import ../../../wrapper/nixGL.nix {inherit pkgs config;};
in {
  # FIXME: Unthemed
  programs.qutebrowser = {
    enable = true;
    package = nixGL pkgs.qutebrowser;
    keyBindings = let
      spawnKeePass = "spawn --userscript qute-keepass -p ~/Sync/passwords/Passwords.kdbx";
    in {
      normal = {
        ",d" = "download-open";
        ",m" = "hint links spawn mpv '{hint-url}'";
        ",b" = "config-cycle colors.webpage.bg '#1d2021' 'white'";
        ";I" = "hint images download";
        "<Ctrl-Shift-J>" = "tab-move +";
        "<Ctrl-Shift-K>" = "tab-move -";
        "<Shift-Escape>" = "fake-key <Escape>";
        "o" = "cmd-set-text -s :open -s";
        "O" = "cmd-set-text -s :open -t -s";
        "<Ctrl-i>" = spawnKeePass;
      };

      insert = {
        "<Ctrl-i>" = spawnKeePass;
      };
    };

    settings = {
      colors.webpage = {
        preferred_color_scheme = "dark";
        darkmode.enabled = false;
      };
      completion = {
        shrink = false;
        use_best_match = true;
      };
      downloads = {
        position = "bottom";
        remove_finished = 10000;
      };
      content.autoplay = false;
      statusbar.widgets = ["progress" "keypress" "url" "history"];
      scrolling.bar = "always";
      tabs = {
        position = "left";
        title = {
          format = "{audio}{current_title}";
          format_pinned = "{audio}{current_title}";
        };
        width = 150;
      };
      fonts.hints = "bold 11pt default_family";
      zoom.default = "110%";

      auto_save.session = true;
      content = {
        blocking.adblock.lists = ["https://easylist.to/easylist/easylist.txt" "https://easylist.to/easylist/easyprivacy.txt" "https://easylist-downloads.adblockplus.org/easylistdutch.txt" "https://easylist-downloads.adblockplus.org/abp-filters-anti-cv.txt" "https://www.i-dont-care-about-cookies.eu/abp/" "https://secure.fanboy.co.nz/fanboy-cookiemonster.txt"];
        cookies = {
          accept = "no-unknown-3rdparty";
          store = true;
        };
        default_encoding = "utf-8";
        javascript.clipboard = "access";
        notifications = {
          enabled = "ask";
          presenter = "libnotify";
          show_origin = true;
        };
        webrtc_ip_handling_policy = "default-public-interface-only";
      };
      editor.command = ["kitty" "nvim" "-e" "exec {line}g{column0}l" "{}"];
      downloads.location.prompt = false;
      input.insert_mode.auto_load = true;
      tabs = {
        show = "multiple";
        last_close = "close";
        mousewheel_switching = false;
      };
    };
  };
}
