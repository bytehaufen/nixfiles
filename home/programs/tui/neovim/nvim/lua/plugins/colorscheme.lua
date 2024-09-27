return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = function(_, opts)
      opts = {
        style = "storm", -- [`storm`|`moon`|`night`|`day`]
        transparent = false,
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
