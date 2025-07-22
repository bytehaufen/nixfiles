{
  pkgs,
  config,
  lib,
  ...
}: let
  configPath = "${config.home.homeDirectory}/nix-config/modules/home/tui/neovim";
  vrapperPath = "${config.xdg.configHome}/vrapper";
  # Hacky to run under non-NixOS
  cheatsheet = pkgs.writeShellScript "vrapper-cheatsheet" ''
    zsh -c "source /home/rico/.config/zsh/.zshrc && kitty zsh -c \"cd /home/rico/.config/vrapper && python3 gen-cheatsheet.py && ${lib.getExe pkgs.glow} -p /tmp/cheatsheet.md\""
  '';
in {
  config = lib.mkIf config.opts.home.tui.enable {
    # For eclipses vim plugin
    home.file.".vrapperrc".text = "source ${vrapperPath}/.vimrc";
    xdg.configFile.vrapper.source = config.lib.file.mkOutOfStoreSymlink "${configPath}/vrapper";

    xdg.desktopEntries = {
      Vrapper-Cheatsheet = {
        name = "Vrapper Cheatsheet";
        exec = "${cheatsheet}";
        terminal = false;
        type = "Application";
        categories = ["Development"];
      };
    };
  };
}
