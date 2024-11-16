{
  programs.zsh = {
    enable = true;
    autosuggestion = {
      enable = true;
      strategy = ["history" "completion" "match_prev_cmd"];
    };
    autocd = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    enableVteIntegration = true;
  };
}
