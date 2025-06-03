{
  lib,
  config,
  pkgs,
  ...
}: {
  config = lib.mkIf config.opts.nixos.printing.enable {
    services = {
      printing = {
        enable = true; # Enable CUPS to print documents.
        drivers = with pkgs; [gutenprint cups-filters epson-escpr];
        browsing = true;
        browsedConf = ''
          BrowseDNSSDSubTypes _cups,_print
          BrowseLocalProtocols all
          BrowseRemoteProtocols all
          CreateIPPPrinterQueues All
          BrowseProtocols all
        '';
        defaultShared = true;
      };
    };
  };
}
