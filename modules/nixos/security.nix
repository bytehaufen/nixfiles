{
  security = {
    pam.services.greetd.enableGnomeKeyring = true;
    polkit.enable = true;
  };
  services = {
    gnome.gnome-keyring.enable = true;
  };
}
