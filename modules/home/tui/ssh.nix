{config, ...}: {
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";

    matchBlocks = {
      "github.com" = {
        hostname = "ssh.github.com";
        user = "git";
        identityFile = config.age.secrets.id_ed25519_github.path;
        identitiesOnly = false;
      };
    };
  };

  services.ssh-agent.enable = true;
}
