{config, ...}: {
  programs.atuin = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
  };
  programs.zsh = {
    enable = true;
    autosuggestion = {
      enable = true;
      strategy = ["history" "completion" "match_prev_cmd"];
    };
    autocd = true;
    syntaxHighlighting.enable = true;

    dotDir = ".config/zsh";

    history = {
      expireDuplicatesFirst = true;
      path = "${config.xdg.dataHome}/zsh_history";
    };
    # defaultKeymap = "vicmd";
    defaultKeymap = "viins";

    initExtra = ''
      # Update all
      function update_arch() {
        yay -Syu --noconfirm
        yay -Yc --noconfirm
        yay -Qtdq --noconfirm
        yarn global upgrade
        rustup upgrade
        nvim --headless "+MasonToolsInstall" +"sleep 20" +qa
        nvim --headless "+Lazy! sync" +qa
      }

      # Search history based on what's typed in the prompt
      autoload -U history-search-end
      zle -N history-beginning-search-backward-end history-search-end
      zle -N history-beginning-search-forward-end history-search-end
      bindkey "^[OA" history-beginning-search-backward-end
      bindkey "^[OB" history-beginning-search-forward-end

      # Open commands in $EDITOR with C-e
      autoload -z edit-command-line
      zle -N edit-command-line
      bindkey "^e" edit-command-line

      # case insensitive tab completion
      zstyle ':completion:*' completer _complete _ignored _approximate
      zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
      zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
      zstyle ':completion:*' menu select
      zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
      zstyle ':completion:*' verbose true

      # Use cache for completions
      zstyle ':completion:*' use-cache on
      zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"
      _comp_options+=(globdots)
    '';

    envExtra = ''
      # Make Nix and home-manager installed things available in PATH.
      . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
      export PATH=$HOME/.local/bin/:/run/current-system/sw/bin/:/nix/var/nix/profiles/default/bin:$HOME/.nix-profile/bin:/etc/profiles/per-user/$USER/bin:$PATH
    '';

    shellAliases = {
      c = "clear";
      cat = "bat";
      clock = "while true; do tput clear; date +'%H : %M' | figlet; sleep 10; done";
      cr = "cargo run";
      cp = "cp -r";
      du = "du -h";
      df = "df -h";
      free = "free -h";
      fzf = "fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'";
      home = "cd ~";
      gg = "lazygit";
      grep = "grep --color";
      ip = "ip --color";
      j = "z";
      ji = "z -i";
      l = "eza --classify --group-directories-first --color=auto --color-scale --all";
      la = "eza --classify --group-directories-first --color=auto --color-scale --all";
      ll = "eza --long --links --group --modified --classify --git --group-directories-first --color=auto --color-scale --icons";
      lla = "eza --long --all --links --group --modified --classify --git --group-directories-first --color=auto --color-scale --icons";
      ls = "eza --classify --group-directories-first --color=auto --color-scale";
      md = "mkdir -p";
      mkdir = "mkdir -p";
      nf = "fastfetch";
      neofetch = "fastfetch";
      # TODO:
      ppc = "powerprofilesctl";
      pf = "powerprofilesctl launch -p performance";
      tree = "eza --all --git --group-directories-first --header --long --tree";
      q = "exit";
      vimdiff = "nvim -d";
      vim = "nvim";
      batt = "acpi -b";

      us = "systemctl --user";
      rs = "sudo systemctl";
    };
  };
}
