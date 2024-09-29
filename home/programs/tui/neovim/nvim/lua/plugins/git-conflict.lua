return {
  -- Git conflict
  {
    "akinsho/git-conflict.nvim",
    lazy = false,
    opts = {
      default_mappings = {
        ours = "<leader>gco",
        theirs = "<leader>gct",
        none = "<leader>gc0",
        both = "<leader>gcb",
        next = "]x",
        prev = "[x",
      },
    },
    keys = {
      { "<leader>gcx", "<cmd>GitConflictListQf<cr>", desc = "List Conflicts" },
      { "<leader>gcr", "<cmd>GitConflictRefresh<cr>", desc = "Refresh Conflicts" },
    },
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts_extend = { "spec" },
    opts = {
      spec = {
        mode = { "n", "v" },
        { "<leader>gc", group = "Git Conflict" },
      },
    },
  },
}
