{pkgs, ...}: {
  home = {
    # Add environment variables
    sessionVariables = {
      DIRENV_LOG_FORMAT = "";
    };

    packages = with pkgs; [
      alejandra # Formatter
      deadnix # Scan nix files for dead code
      statix # Lints and suggestions for the Nix programming language
      nix-output-monitor # nom
      cachix # Cachix
      lorri # Nix project development environment
      nil # Nix language server
    ];
  };

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
      enableNushellIntegration = true;
    };

    nix-index = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
