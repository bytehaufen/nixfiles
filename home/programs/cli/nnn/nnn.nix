{ pkgs, ... }:
let
  # Custom plugin path
  customPluginPath = ./plugins;

  # Standard plugins from nnn repository
  standardPlugins =
    pkgs.fetchFromGitHub {
      owner = "jarun";
      repo = "nnn";
      rev = "v4.9";
      sha256 = "sha256-g19uI36HyzTF2YUQKFP4DE2ZBsArGryVHhX79Y0XzhU=";
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
      bat
      git
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
