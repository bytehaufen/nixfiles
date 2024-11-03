return {
  {
    "echasnovski/mini.files",
    lazy = true,
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
      mappings = {
        close = "q",
        go_in = "l",
        go_in_plus = "L",
        go_out = "h",
        go_out_plus = "H",
        mark_goto = "'",
        mark_set = "m",
        reset = "<BS>",
        reveal_cwd = "@",
        show_help = "g?",
        synchronize = "<C-s>", -- Customized
        trim_left = "<",
        trim_right = ">",
      },
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
