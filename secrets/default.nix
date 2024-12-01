{
  inputs,
  pkgs,
  vars,
  config,
  ...
}: {
  imports = [
    inputs.agenix.nixosModules.default
  ];

  environment.systemPackages = [
    inputs.agenix.packages."${pkgs.system}".default
  ];

  age = {
    identityPaths = ["/etc/ssh/ssh_host_ed25519_key"];
    secrets = {
      "id_ed25519_rico" = {
        file = "${inputs.secrets}/id_ed25519_rico.age";
        mode = "0500";
        owner = vars.username;
      };

      "id_ed25519_rico.pub" = {
        file = "${inputs.secrets}/id_ed25519_rico.pub.age";
        mode = "0500";
        owner = vars.username;
      };
    };
  };

  # Place secrets in /etc/
  environment.etc = {
    "ssh/id_ed25519_rico" = {
      source = config.age.secrets."id_ed25519_rico".path;
      mode = "0400";
      user = "${vars.username}";
    };

    "ssh/id_ed25519_rico.pub" = {
      source = config.age.secrets."id_ed25519_rico.pub".path;
      mode = "0400";
      user = "${vars.username}";
    };
  };
}
