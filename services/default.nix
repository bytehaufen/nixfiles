{
  services = {
    syncthing.enable = true;

    # Enable by `systemctl --user start dunst.service` -- need to check
    dunst = {
      enable = true;
      settings = import ./dunst;
    };
  };

  #TODO: config this
  # dunst
}
