{...}: {
  imports = [./nnn ./starship.nix ./zellij.nix];

  programs = {
    # Type `z <pat>` to cd to some directory
    zoxide.enable = true;

    # Type `<ctrl> + r` to fuzzy search your shell history
    fzf.enable = true;
    jq.enable = true;
    # Install btop https://github.com/aristocratos/btop

    bat = {
      enable = true;
      config = {
        # theme = "gruvbox-dark";
        tabs = "2";
      };
    };
    git.delta.enable = true;

    lazygit = {
      enable = true;
      settings = {
        git.paging = {
          colorArg = "always";
          pager = "delta --dark --paging=never -s";
        };
      };
    };

    btop = {
      enable = true;
      settings = {
        #   color_theme = "gruvbox_dark";
        # theme_background = false;
        vim_keys = true;
      };
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
      # TODO:
      enableZshIntegration = true;
      config.global = {
        hide_env_diff = true;
      };
    };

    neovim = {
      enable = true;
    };

    ## TODO: Enable
    # bash = {
    #   enable = true;
    #   initExtra = ''
    #     # Make Nix and home-manager installed things available in PATH.
    #     . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
    #     export PATH=/run/current-system/sw/bin/:/nix/var/nix/profiles/default/bin:$HOME/.nix-profile/bin:/etc/profiles/per-user/$USER/bin:$PATH
    #   '';
    # };
    #
    # zsh = {
    #   enable = true;
    #   autosuggestion.enable = true;
    #   syntaxHighlighting.enable = true;
    #   envExtra = ''
    #     # Make Nix and home-manager installed things available in PATH.
    #     . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
    #     export PATH=/run/current-system/sw/bin/:/nix/var/nix/profiles/default/bin:$HOME/.nix-profile/bin:/etc/profiles/per-user/$USER/bin:$PATH
    #   '';
    # };

    # TODO:
    # zsh.enable = true;

    # TODO:
    #git.enable = true;
  };
}
