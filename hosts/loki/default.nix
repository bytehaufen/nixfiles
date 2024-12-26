{
  vars,
  inputs,
  config,
  ...
}: {
  imports = [
    inputs.disko.nixosModules.disko
    ./hardware-configuration.nix
    ./disko-config.nix

    ../core/global
    ../core/users/${vars.username}

    ../core/optional/greetd.nix
    ../core/optional/hyprland.nix
    ../core/optional/kdeconnect.nix
    ../core/optional/pipewire.nix
    ../core/optional/quietboot.nix
    ../core/optional/wireless.nix
  ];

  networking = {
    hostName = "loki";
    networkmanager.enable = true;
  };
  system.activationScripts."hosts-work".text = ''
    tmpfile=$(mktemp)
    cat /etc/hosts ${config.age.secrets."hosts-work".path} > $tmpfile
    mv $tmpfile /etc/hosts
    chmod 644 /etc/hosts
  '';

  programs = {
    adb.enable = true;
    dconf.enable = true;
  };

  hardware.graphics.enable = true;

  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        consoleMode = "max";
      };
      efi.canTouchEfiVariables = true;
    };

    # For cross-compilation
    binfmt.emulatedSystems = [
      "aarch64-linux"
      "i686-linux"
    ];
  };

  system.stateVersion = "22.05";
}
