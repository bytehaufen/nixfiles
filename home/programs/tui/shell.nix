{
  config,
  pkgs,
  ...
}: {
  home.packages = [pkgs.figlet]; # Required by alias clock

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

    envExtra =
      # sh
      ''
        # Populate the `PATH` variable with the Nix profile paths.
        # export PATH="$PATH:/run/current-system/sw/bin/:/nix/var/nix/profiles/default/bin:/etc/profiles/per-user/$USER/bin"
        export PATH="$PATH:$HOME/.nix-profile/share/applications"
      '';

    shellAliases = {
      c = "clear";
      cat = "bat";
      clock = "sh -c 'tput civis; trap \"tput cnorm\" EXIT; while true; do tput clear; date +\"%H : %M\" | figlet; sleep 10; done'";
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
