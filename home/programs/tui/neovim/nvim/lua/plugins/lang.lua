return {
  -- Additional LSP's to be installed by mason
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "bashls",
          "dockerls",
          "gradle_ls",
          "html",
          "arduino_language_server",
          "docker_compose_language_service",
        })
      end
      opts.automatic_installation = true
      return opts
    end,
  },
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      -- Ensure all languages are installed who care disc space
      ensure_installed = "all",
    },
  },
}
