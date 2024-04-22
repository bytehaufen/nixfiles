{ pkgs, programs, ... }:
let
  # Custom plugin path
  customPluginPath = ./plugins;

  # Standard plugins from nnn repository
  standardPlugins =
    pkgs.fetchFromGitHub
      {
        owner = "jarun";
        repo = "nnn";
        rev = "master";
        sha256 = "sha256-7fMmeh0YD9G3NSKsLVX3wmQuH7WO8CEms7MeXxMh0/E=";
      }
    + "/plugins";

  # Copy all plugins for merging
  allPlugins = pkgs.runCommand "all-plugins" { } ''
    mkdir -p $out
    cp -r ${standardPlugins}/* $out
    cp -r ${standardPlugins}/.* $out

    cp -r ${customPluginPath}/* $out
  '';
in
{
  # Set nnn fifo for plugin preview-tui
  home.sessionVariables = {
    NNN_FIFO = "/tmp/nnn.fifo";
  };

  programs.nnn = {
    enable = true;

    package = pkgs.nnn.override ({ withNerdIcons = true; });

    # Essential tools
    extraPackages = with pkgs; [
      fzf
      ripgrep
      ffmpegthumbnailer
      mediainfo
      sxiv
    ];

    plugins = {
      src = allPlugins;

      mappings = {
        # Default plugins
        c = "fzcd";
        p = "preview-tui";

        # Custom plugins
        g = "grep";
        l = "gitlog";
      };
    };
  };
}
