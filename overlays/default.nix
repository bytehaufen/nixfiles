{inputs, ...}: {
  # Adds pkgs.stable == inputs.nixpkgsStable.legacyPackages.${pkgs.system}
  stable = final: _: {
    stable = inputs.nixpkgsStable.legacyPackages.${final.system};
  };

  # Add stable version of nixpkgs to pkgs -> pkgs.stable
  # (_final: _prev: {stable = import nixpkgsStable {inherit system;};})
  # Enable JavaFX for jdk
  jdk = _final: prev: {
    jdk = prev.jdk.override {enableJavaFX = true;};
  };
}
