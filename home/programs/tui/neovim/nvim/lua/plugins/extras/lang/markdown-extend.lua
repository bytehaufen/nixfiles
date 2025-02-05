return {
  -- Markdown preview
  {
    "iamcco/markdown-preview.nvim",
    -- NOTE: Init is the dirty way, but not all settings are taken when using opts
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_auto_close = 0
      vim.g.mkdp_combine_preview = 1
      vim.g.mkdp_combine_preview_auto_refresh = 1
      vim.g.mkdp_auto_start = 0
    end,
  },
}
