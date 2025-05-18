{config, ...}: let
  home = config.home.homeDirectory;
in {
  imports = [../secrets];

  age = {
    identityPaths = ["${home}/.ssh/ssh_host_ed25519_key"];
    secretsDir = "${home}/.agenix/agenix";
    secretsMountPoint = "${home}/.agenix/agenix.d";
  };
}
