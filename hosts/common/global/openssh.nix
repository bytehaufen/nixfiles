{
  outputs,
  lib,
  config,
  ...
}: let
  hosts = lib.attrNames outputs.nixosConfigurations;
in {
  services.openssh = {
    enable = true;
    settings = {
      # Harden
      PasswordAuthentication = false;
      PermitRootLogin = "no";

      # Automatically remove stale sockets
      StreamLocalBindUnlink = "yes";
      # Allow forwarding ports to everywhere
      GatewayPorts = "clientspecified";
      # Let WAYLAND_DISPLAY be forwarded
      AcceptEnv = "WAYLAND_DISPLAY";
      X11Forwarding = true;
    };
  };

  programs.ssh = {
    # Each hosts public key
    knownHosts = lib.genAttrs hosts (hostname: {
      publicKeyFile = ../../${hostname}/ssh_host_ed25519_key.pub;
      extraHostNames =
        # Alias for localhost if it's the same host
        lib.optional (hostname == config.networking.hostName) "localhost";
    });
  };

  # Passwordless sudo when SSH'ing with keys
  security.pam.sshAgentAuth = {
    enable = true;
    authorizedKeysFiles = ["/etc/ssh/authorized_keys.d/%u"];
  };
}
