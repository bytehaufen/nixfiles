return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = function(_, opts)
      vim.g.tokyonight_dark_float = false

      opts = {
        style = "storm", -- [`storm`|`moon`|`night`|`day`]
        -- FIXME: make this dependent on neovide
        transparent = vim.g.neovide ~= true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
        },
        hide_inactive_statusline = false,
        dim_inactive = true,
        lualine_bold = false,
      }
      return opts
    end,
  },
}
