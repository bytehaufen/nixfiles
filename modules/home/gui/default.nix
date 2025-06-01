{lib, ...}: {
  imports = [
    ./browser.nix
    ./emulator.nix
    ./gammastep.nix
    ./kitty.nix
    ./media.nix
    ./messaging.nix
    ./obs.nix
    ./office.nix
    ./packages.nix
  ];

  options.opts.home.gui = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable the GUI configuration for the home module.";
    };
  };
}
