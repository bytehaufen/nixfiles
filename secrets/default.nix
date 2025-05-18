{inputs, ...}: {
  age = {
    secrets = {
      "smb-secrets" = {
        file = "${inputs.secrets}/smb-secrets.age";
        mode = "0400";
      };
    };
  };
}
