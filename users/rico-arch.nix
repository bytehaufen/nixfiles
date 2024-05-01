{
  pkgs,
  system,
  ...
}: let
  services = import ../services;
  programs = import ../programs;
in {
  # Nixpkgs config
  nixpkgs = {
    config = {
      inherit system;

      allowUnfree = true;
      allowUnsupportedSystem = true;
      experimental-features = "nix-command flakes";
    };
  };

  imports = [services programs];

  home = {
    username = "rico";
    homeDirectory = "/home/rico/";

    stateVersion = "23.11";

    sessionVariables = {
      EDITOR = "nvim";
    };

    packages = import ../packages {inherit pkgs;};

    shellAliases = {
      # FIXME: not working
      reload-home-manager-config = "home-manager switch --flake ${builtins.toString ./.}";
    };
  };
}