{
  lib,
  config,
  pkgs,
  ...
}: {
  # Nchat is a terminal-based chat client with support for Telegram and WhatsApp
  #
  # To configure run
  # `nchat --setup`
  #
  # More information can be found at https://github.com/d99kris/nchat
  config = lib.mkIf config.opts.home.programs.nchat.enable {
    home.packages = [pkgs.nchat];
  };
}
