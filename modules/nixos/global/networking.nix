{
  # Service to discover network printers in network and make machines available
  # through {hostname}.local domain
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
    publish = {
      enable = true;
      domain = true;
      userServices = true;
    };
  };
}
