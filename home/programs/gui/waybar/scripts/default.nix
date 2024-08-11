{pkgs, ...}: {
  getSuspendStatus = pkgs.writeShellScriptBin "get_suspend_status.sh" (builtins.readFile ./get_suspend_status.sh);
  getKeymapLang = pkgs.writeShellScriptBin "get_keymap_lang.sh" (builtins.readFile ./get_keymap_lang.sh);
}
