{
  services = {
    power-profiles-daemon = {
      enable = true;
    };
    # DBus service that provides power management support to applications
    upower.enable = true;
  };
}
