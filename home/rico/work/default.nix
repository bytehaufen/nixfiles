{config, ...}: let
  identityFile = config.age.secrets.id_ed25519_rico_work.path;
  localhost = "127.0.0.1";
in {
  programs.ssh = {
    matchBlocks = {
      svn = {
        inherit identityFile;
        hostname = "zapp2";
        user = "costun";
        identitiesOnly = true;
      };
      jira-tunnel = {
        inherit identityFile;
        hostname = "kif";
        user = "costun";
        identitiesOnly = true;
        localForwards = let
          port = 58080;
        in [
          {
            bind = {inherit port;};
            host.address = localhost;
            host = {inherit port;};
          }
        ];
      };
      confluence-tunnel = {
        inherit identityFile;
        hostname = "kif";
        user = "costun";
        identitiesOnly = true;
        localForwards = let
          port = 58090;
        in [
          {
            bind = {inherit port;};
            host.address = localhost;
            host = {inherit port;};
          }
        ];
      };
      gitlab-tunnel = {
        inherit identityFile;
        hostname = "kif";
        user = "costun";
        identitiesOnly = true;
        localForwards = let
          port = 59080;
        in [
          {
            bind = {inherit port;};
            host.address = localhost;
            host = {inherit port;};
          }
        ];
      };
    };
  };
}
