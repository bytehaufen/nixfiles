{
  pkgs,
  config,
  ...
}: let
  configPath = "${config.home.homeDirectory}/nix-config/modules/home/tui/neovim";
  vrapperPath = "${config.xdg.configHome}/vrapper";
  # Hacky to run under non-NixOS
  cheatsheet = pkgs.writeShellScript "vrapper-cheatsheet" ''
    zsh -c "source /home/rico/.config/zsh/.zshrc && kitty zsh -c \"cd /home/rico/.config/vrapper && python3 gen-cheatsheet.py && /nix/store/237c2x56rnq7xzgwya1bm5chj8xyypzf-glow-2.1.1/bin/glow -t /tmp/cheatsheet.md\""
  '';
in {
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
}
