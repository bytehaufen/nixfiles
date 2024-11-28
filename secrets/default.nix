{
  inputs,
  pkgs,
  vars,
  config,
  ...
}: let
  noaccess = {
    mode = "0000";
    # owner = "root";
  };
  high_security = {
    mode = "0500";
    owner = "root";
  };
  user_readable = {
    mode = "0500";
    owner = vars.username;
  };
in {
  imports = [
    inputs.agenix.nixosModules.default
  ];

  environment.systemPackages = [
    inputs.agenix.packages."${pkgs.system}".default
  ];

  age = {
    identityPaths = ["/etc/ssh/ssh_host_ed25519_key" "${config.home.homeDirectory}/.ssh/id_ed25519_rico"];
    secrets = {
    };
  };
}
