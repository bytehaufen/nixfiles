{
  hardware.bluetooth = {
    enable = true;
  };

  # Wireless networking is enabled by `networking.networkmanager`

  # Ensure group exists
  users.groups.network = {};
}
