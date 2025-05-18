{
  config,
  pkgs,
  ...
}: {
  programs.atuin = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
    settings = {
      keymap_mode = "auto";
    };
  };

  programs.zsh = {
    enable = true;
    autosuggestion = {
      enable = true;
      strategy = ["history" "completion" "match_prev_cmd"];
    };
    autocd = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    # Fix for https://discourse.nixos.org/t/zsh-compinit-warning-on-every-shell-session/22735/6
    completionInit = "autoload -U compinit && compinit -i";
    enableVteIntegration = true;

    dotDir = ".config/zsh";

    history = {
      expireDuplicatesFirst = true;
      path = "${config.xdg.dataHome}/zsh_history";
    };

    plugins = [
      {
        name = "vi-mode";
        src = pkgs.zsh-vi-mode;
        file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
      }
    ];

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      PAGER = "less";
      MANPAGER = "nvim +Man!";
      DIFFPROG = "nvim -d";

      ZVM_VI_INSERT_ESCAPE_BINDKEY = "jk";
    };

    # TODO: Refactor, e.g. ssh-agent is at the wrong place
    initExtra = ''
      eval `ssh-agent -s` &> /dev/null
      # Work
      if [ -f /etc/ssh/id_ed25519_rico_work ]; then
        ssh-add /etc/ssh/id_ed25519_rico_work &> /dev/null
      fi
      # Priv
      if [ -f /etc/ssh/id_ed25519_rico ]; then
        ssh-add /etc/ssh/id_ed25519_rico &> /dev/null
      fi

      # Update all
      function update-arch() {
        yay -Syu --noconfirm
        yay -Yc --noconfirm

        yay -Rns $(yay -Qtdq --noconfirm) --noconfirm 2>&1 /dev/null
        rustup upgrade
        nvim --headless "+Lazy! sync" +qa
        nvim --headless -c "TSUpdateSync" +qa
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
      # Make sure that the user's bin directory is the first in PATH.
      export PATH="$HOME/.local/bin/:$PATH"

      # Populate the `PATH` variable with the Nix profile paths.
      # export PATH="$PATH:/run/current-system/sw/bin/:/nix/var/nix/profiles/default/bin:/etc/profiles/per-user/$USER/bin"
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
      # j = "z";
      zz = "zi";
      l = "eza --classify --group-directories-first --color=auto --color-scale --all";
      la = "eza --classify --group-directories-first --color=auto --color-scale --all";
      ll = "eza --long --links --group --modified --classify --git --group-directories-first --color=auto --color-scale --icons";
      lla = "eza --long --all --links --group --modified --classify --git --group-directories-first --color=auto --color-scale --icons";
      ls = "eza --classify --group-directories-first --color=auto --color-scale";
      md = "mkdir -p";
      mkdir = "mkdir -p";
      nf = "fastfetch";
      neofetch = "fastfetch";
      pf = "powerprofilesctl launch -p performance";
      tree = "eza --git --group-directories-first --header --long --tree";
      q = "exit";
      vimdiff = "nvim -d";
      vim = "nvim";
      wlc = "wl-copy";
      wlp = "wl-paste";
      batt = "acpi -b";

      us = "systemctl --user";
      rs = "sudo systemctl";

      qn = "nvim $HOME/Sync/notes/quicknote.md";

      "..." = "../..";
      "...." = "../../..";
      "....." = "../../../..";
    };
  };
}
