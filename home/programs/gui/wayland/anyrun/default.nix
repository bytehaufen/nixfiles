{
  pkgs,
  inputs,
  lib,
  config,
  ...
}: {
  imports = [
    inputs.anyrun.homeManagerModules.default
  ];

  programs.anyrun = {
    enable = true;

    config = {
      plugins = with inputs.anyrun.packages.${pkgs.system}; [
        applications
        dictionary
        randr
        rink
        shell
        symbols
        translate
      ];

      width.fraction = 0.25;
      y.absolute = 15;
      hidePluginInfo = false;
    };

    extraConfigFiles = {
      "applications.ron".text =
        # ron
        ''
          Config(
            desktop_actions: false,
            max_entries: 5,
            terminal: Some("kitty"),
          )
        '';

      "randr.ron".text =
        # ron
        ''
          Config(
            prefix: ":dp",
            max_entries: 10,
          )
        '';

      "shell.ron".text =
        # ron
        ''
          Config(
            prefix: ":!",
          )
        '';
    };

    extraCss = let
      inherit (inputs.nix-colors.lib.conversions) hexToRGBString;
      inherit (config.colorScheme) palette;
      toRGBA = color: opacity: "rgba(${hexToRGBString "," (lib.removePrefix "#" color)},${toString opacity})";

      bg-col = toRGBA palette.base00 0.7;
      border-col = toRGBA palette.base0A 0.7;
      selected-col = toRGBA palette.base0A 0.7;
      fg-col = "#ffffff";
      fg-col2 = "#" + palette.base0F;
      bg-main-box = toRGBA palette.base01 0.7;
    in
      # css
      ''
        * {
          transition: 200ms ease;
          font-size: 1.3rem;
        }

        #window {
          background: transparent;
        }

        #plugin,
        #main {
          color: ${fg-col};
          background-color: ${bg-col};
        }
        #entry {
          color: ${fg-col};
          background-color: ${bg-col};
        }

        #match {
          color: ${fg-col};
          background: ${bg-col};
        }

        #match:selected {
          color: ${fg-col2};
          background: ${selected-col};
        }

        #match {
          padding: 3px;
          border-radius: 15px;
        }

        #entry, #plugin:hover {
          border-radius: 15px;
        }

        box#main {
          background: ${bg-main-box};
          border: 1px solid ${border-col};
          border-radius: 15px;
          padding: 5px;
        }
      '';
  };
}
