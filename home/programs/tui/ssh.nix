{
  config,
  lib,
  ...
}: {
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";

    matchBlocks = {
      "github.com" = {
        hostname = "ssh.github.com";
        user = "git";
        identityFile = config.age.secrets.id_ed25519_github.path;
        identitiesOnly = true;
      };
    };
  };

  services.ssh-agent.enable = true;

  # FIXME: Test for non-nixos to place a secret after activation with:
  # Or do it with just pointing to the agenix secrets dir
  home.activation.linkSecret = let
    secretsDir = "${config.home.homeDirectory}/.secrets";
    secret = "${secretsDir}/smb-secrets";
  in
    lib.hm.dag.entryAfter ["writeBoundary"] ''
      mkdir -p ${secretsDir}
      ln -sf ${config.age.secrets.smb-secrets.path} ${secret}
      chmod 600 ${secret}
    '';
}
