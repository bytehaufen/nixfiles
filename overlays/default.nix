{inputs, ...}: {
  # Adds pkgs.stable == inputs.nixpkgsStable.legacyPackages.${pkgs.system}
  stable = final: _: {
    stable = inputs.nixpkgsStable.legacyPackages.${final.system};
  };

  # Enable JavaFX for jdk
  jdk = _: prev: {
    jdk = inputs.nixpkgsStable.legacyPackages.${prev.system}.jdk.override {enableJavaFX = true;};
  };
}
