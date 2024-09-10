{
  pkgs,
  config,
  ...
}: let
  passwordStoreDir = "${config.xdg.dataHome}/password-store";
in {
  # NOTE: Restart gpg-agent after changing pinentry program
  #
  # ```shell
  # gpgconf --kill gpg-agent
  # ```
  services.gpg-agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-qt;
  };

  # Password store
  programs = {
    password-store = {
      enable = true;
      package = pkgs.pass.withExtensions (exts: [
        # [awesome-password-store](https://github.com/tijn/awesome-password-store)
        exts.pass-update # A pass extension that provides an easy flow for updating passwords
        exts.pass-import # A generic importer tool from other password managers
      ]);
      settings = {
        PASSWORD_STORE_DIR = passwordStoreDir;
        PASSWORD_STORE_CLIP_TIME = "60";
        PASSWORD_STORE_GENERATED_LENGTH = "15";
        PASSWORD_STORE_ENABLE_EXTENSIONS = "true";
      };
    };
    browserpass = {
      enable = true;
      browsers = [
        "brave"
        "chrome"
        "chromium"
        "firefox"
      ];
    };
  };
}
