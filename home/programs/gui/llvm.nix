{pkgs, ...}: {
  home.packages = with pkgs; [
    gpt4all # Free-to-use, locally running, privacy-aware chatbot. No GPU or internet required.
  ];
}
