{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  configPath = "${config.home.homeDirectory}/nix-config/modules/home/tui/neovim";
in {
  imports = [./vrapper];

  config = lib.mkIf config.opts.home.tui.enable {
    # Make a (writeable) symlink to ~/.config
    xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "${configPath}/nvim";

    home.packages = with pkgs; [imagemagick gcc lynx markdownlint-cli2 go mermaid-cli];

    programs = {
      zsh.shellAliases = {
        e = "nvim";
      };

      neovim = {
        enable = true;
        package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
        withNodeJs = true;
        withRuby = true;
        withPython3 = true;
        defaultEditor = false;
        vimAlias = false;
        vimdiffAlias = true;
        extraLuaPackages = ps: [ps.magick];

        plugins = with pkgs.vimPlugins; [
          telescope-fzf-native-nvim

          nvim-treesitter.withAllGrammars
        ];

        # These environment variables are needed to build and run binaries
        # with external package managers like mason.nvim.
        #
        # LD_LIBRARY_PATH is also needed to run the non-FHS binaries downloaded by mason.nvim.
        # it will be set by nix-ld, so we do not need to set it here again.
        extraWrapperArgs = with pkgs; [
          # LIBRARY_PATH is used by gcc before compilation to search directories
          # containing static and shared libraries that need to be linked to your program.
          "--suffix"
          "LIBRARY_PATH"
          ":"
          "${lib.makeLibraryPath [stdenv.cc.cc zlib]}"

          # PKG_CONFIG_PATH is used by pkg-config before compilation to search directories
          # containing .pc files that describe the libraries that need to be linked to your program.
          "--suffix"
          "PKG_CONFIG_PATH"
          ":"
          "${lib.makeSearchPathOutput "dev" "lib/pkgconfig" [stdenv.cc.cc zlib]}"
        ];
      };
    };
  };
}
