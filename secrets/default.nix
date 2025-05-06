{
  inputs,
  pkgs,
  vars,
  config,
  lib,
  ...
}: let
  isNixOS = vars.isNixOS.content or vars.isNixOS;

  agenixModule =
    if isNixOS
    then inputs.agenix.nixosModules.default
    else inputs.agenix.homeManagerModules.default;

  sshDir =
    if isNixOS
    then "ssh"
    else ".ssh";
  secretFiles = {
    "${sshDir}/id_ed25519_rico" = {
      source = config.age.secrets."id_ed25519_rico".path;
      mode = "0400";
      user = vars.username;
    };

    "${sshDir}/id_ed25519_rico.pub" = {
      source = config.age.secrets."id_ed25519_rico.pub".path;
      mode = "0400";
      user = vars.username;
    };

    "${sshDir}/id_ed25519_rico_work" = {
      source = config.age.secrets."id_ed25519_rico_work".path;
      mode = "0400";
      user = vars.username;
    };
  };
in {
  imports = [agenixModule];

  environment = lib.mkIf isNixOS {
    systemPackages = [
      inputs.agenix.packages."${pkgs.system}".default
    ];

    # Place secrets in /etc/
    etc = secretFiles;
  };

  home-manager.users.${vars.username} = lib.mkIf (!isNixOS) {
    home.packages = [
      inputs.agenix.packages."${pkgs.system}".default
    ];

    # Place secrets in /etc/
    file = secretFiles;
  };

  age = {
    identityPaths = ["/etc/ssh/ssh_host_ed25519_key"];
    secretsDir = lib.mkIf (!isNixOS) "${config.home.homeDirectory}/.agenix/agenix";
    secretsMountPoint = lib.mkIf (!isNixOS) "${config.home.homeDirectory}/.agenix/agenix.d";
    secrets = {
      "id_ed25519_rico" = {
        file = "${inputs.secrets}/id_ed25519_rico.age";
        mode = "0400";
        owner = vars.username;
      };

      "id_ed25519_rico.pub" = {
        file = "${inputs.secrets}/id_ed25519_rico.pub.age";
        mode = "0400";
        owner = vars.username;
      };

      "id_ed25519_rico_work" = {
        file = "${inputs.secrets}/id_ed25519_rico_work.age";
        mode = "0400";
        owner = vars.username;
      };

      "smb-secrets" = {
        file = "${inputs.secrets}/smb-secrets.age";
        mode = "0400";
        owner = "root";
      };

      "hosts-work" = {
        file = "${inputs.secrets}/hosts-work.age";
        path = "/etc/agenix/hosts-work";
        mode = "0777";
        owner = "rico";
        symlink = false;
      };
    };
  };
}
