{config, ...}: let
  home = config.home.homeDirectory;
in {
  imports = [../secrets];

  age = {
    identityPaths = ["${home}/.ssh/id_ed25519_rico"];
    secretsDir = "${home}/.agenix/agenix";
    secretsMountPoint = "${home}/.agenix/agenix.d";
  };
}
