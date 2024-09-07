return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "moon", -- [`storm`|`moon`|`night`|`day`]
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
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     lazy = false,
  --     priority = 1000,
  --     colorscheme = "gruvbox-baby",
  --     enable = true,
  --   },
  -- },
  -- {
  --   "luisiacc/gruvbox-baby",
  --   opts = {
  --     lazy = false,
  --     priority = 1000,
  --   },
  --   config = function()
  --     vim.g.gruvbox_baby_transparent_mode = true
  --     vim.g.gruvbox_baby_background_color = "dark"
  --   end,
  -- },
  -- { "rcarriga/nvim-notify", opts = {
  --   lazy = false,
  --   priority = 1000,
  --   background_colour = "#282828",
  -- } },
}
