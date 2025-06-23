{pkgs, ...}: let
  bash-no-nix = pkgs.writeShellScriptBin "bash-no-nix" ''
    #!/usr/bin/env bash
    unset NIX_PATH NIX_PROFILES NIX_SSL_CERT_FILE NIX_USER_PROFILE_DIR NIX_REMOTE NIX_BUILD_SHELL
    export PATH=$(echo "$PATH" | tr ':' '\n' | grep -v '/nix/store' | grep -v "$HOME/.nix-profile" | grep -v '/nix/var/nix/profiles/default/bin' | paste -sd:)
    exec bash --noprofile --norc
  '';
in {
  home.packages = [bash-no-nix];
}
