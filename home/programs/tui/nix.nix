{
  pkgs,
  self,
  ...
}: {
  home = {
    # Add environment variables
    sessionVariables = {
      # Auto-run programs using nix-index-database
      NIX_AUTO_RUN = "1";
      DIRENV_LOG_FORMAT = "";
    };

    packages = with pkgs; [
      alejandra # Formatter
      deadnix # Scan nix files for dead code
      statix # Lints and suggestions for the Nix programming language
      self.packages.${pkgs.system}.repl # Nix REPL
      nix-output-monitor # nom
      cachix # Cachix
      lorri # Nix project development environment
      nil # Nix language server
    ];
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;

    config.global = {
      hide_env_diff = true;
    };
  };
}