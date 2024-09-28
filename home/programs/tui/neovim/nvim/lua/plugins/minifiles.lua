return {
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  {
    "echasnovski/mini.files",
    keys = {
      {
        "<leader>e",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = "Open mini.files (directory of current file)",
      },
      {
        "<leader>E",
        function()
          require("mini.files").open(vim.uv.cwd(), true)
        end,
        desc = "Open mini.files (cwd)",
      },
      {
        "<leader>fm",
        function()
          require("mini.files").open(LazyVim.root(), true)
        end,
        desc = "Open mini.files (root)",
      },
    },

    opts = {
      windows = {
        preview = true,
        width_nofocus = 20,
        width_focus = 50,
        width_preview = 100,
      },
      options = {
        permanent_delete = false,
      },
    },
  },
}