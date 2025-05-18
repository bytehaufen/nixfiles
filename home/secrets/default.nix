{inputs, ...}: {
  age = {
    secrets = {
      "id_ed25519_rico" = {
        file = "${inputs.secrets}/id_ed25519_rico.age";
        mode = "0400";
      };

      "id_ed25519_rico.pub" = {
        file = "${inputs.secrets}/id_ed25519_rico.pub.age";
        mode = "0400";
      };

      "id_ed25519_rico_work" = {
        file = "${inputs.secrets}/id_ed25519_rico_work.age";
        mode = "0400";
      };

      "smb-secrets" = {
        file = "${inputs.secrets}/smb-secrets.age";
        mode = "0400";
      };
    };
  };
}
