{
  lib,
  config,
  pkgs,
  ...
}: {
  config = lib.mkIf config.opts.nixos.programs.zsh.enable {
    programs.zsh.enable = true;
    users.defaultUserShell = pkgs.zsh;
    environment.pathsToLink = ["/share/zsh"];
  };
}
