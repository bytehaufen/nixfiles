return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "storm", -- [`storm`|`moon`|`night`|`day`]
      transparent = false,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = "dark",
        floats = "dark",
      },
      hide_inactive_statusline = false,
      dim_inactive = true,
      lualine_bold = false,
    },
  },
}
