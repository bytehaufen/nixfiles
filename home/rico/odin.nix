{
  imports = [
    ./core.nix
  ];

  opts.home = {
    services = {
      syncthing.enable = true;
    };
  };
}
