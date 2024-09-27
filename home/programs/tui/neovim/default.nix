{
  config,
  pkgs,
  lib,
  ...
}: {
  home.activation.installNvim = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F444 ${./nvim}/ ${config.xdg.configHome}/nvim/
  '';

  # For eclipses vim plugin
  home.file.".vrapperrc".source = ./.vrapperrc;

  programs = {
    zsh.shellAliases = {
      e = "nvim";
    };

    neovim = {
      enable = true;
      package = pkgs.neovim-unwrapped;

      defaultEditor = false;
      vimAlias = false;
      extraLuaPackages = ps: [ps.magick];
      extraPackages = with pkgs; [imagemagick gcc];

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
}
