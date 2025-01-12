{pkgs, ...}: {
  nixpkgs.config = {
    programs.npm.npmrc = ''
      prefix = ''${HOME}/.npm-global
    '';
  };

  home.packages = with pkgs; [
    # Nix
    nil
    nixd
    statix # Lints and suggestions for the nix programming language
    deadnix # Find and remove unused code in .nix source files
    alejandra # Nix Code Formatter

    taplo # TOML language server / formatter / validator
    nodePackages.yaml-language-server
    actionlint # GitHub Actions linter

    # Dockerfile
    hadolint # Dockerfile linter
    nodePackages.dockerfile-language-server-nodejs

    # Markdown
    marksman # language server for markdown
    glow # markdown previewer
    pandoc # document converter

    # Sql
    sqlfluff

    # C/C++
    cmake
    cmake-language-server
    gnumake
    checkmake
    gcc
    gdb
    clang-tools
    lldb
    vscode-extensions.vadimcn.vscode-lldb.adapter # codelldb - debugger

    # Python
    pyright # Python language server
    (python312.withPackages (
      ps:
        with ps; [
          ruff
          black # Python formatter

          ipython
          ipykernel
          jupyter
          pandas
          pyquery
          pyyaml
          requests
          tabulate
        ]
    ))

    # Rust
    rustc
    rust-analyzer
    cargo # Rust package manager
    rustfmt
    clippy # Rust linter

    # Go
    go
    delve # Go debugger

    # Java
    jdk
    gradle
    maven
    jdt-language-server

    # Lua
    lua
    stylua
    lua-language-server
    luarocks
    luajitPackages.magick # Lua bindings for ImageMagick
    luajitPackages.lpeg # Lua parsing expression grammars

    # Bash
    nodePackages.bash-language-server
    shellcheck
    shfmt

    # Web dev
    nodePackages.nodejs
    nodePackages.typescript
    nodePackages.typescript-language-server
    nodePackages.vscode-langservers-extracted
    nodePackages."@tailwindcss/language-server"
    emmet-ls

    # English prose linter
    proselint

    # Optional
    nodePackages.prettier # common code formatter
    fzf
    gdu # disk usage analyzer, required by AstroNvim
    (ripgrep.override {withPCRE2 = true;}) # recursively searches directories for a regex pattern
  ];
}
