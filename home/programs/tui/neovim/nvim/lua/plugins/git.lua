return {
  -- Git diff view
  {
    "sindrets/diffview.nvim",
    cmd = "DiffviewOpen",
    keys = {
      { "<leader>gdd", mode = { "n" }, "<cmd>DiffviewOpen<cr>", desc = "Diffview Open" },
      { "<leader>gdh", mode = { "n" }, "<cmd>DiffviewFileHistory<cr>", desc = "Diffview File History" },
      { "<leader>gdq", mode = { "n" }, "<cmd>DiffviewClose<cr>", desc = "Diffview Close" },
      { "<leader>gde", mode = { "n" }, "<cmd>DiffviewToggleFiles<cr>", desc = "Diffview Toggle Files" },
    },
  },

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
        { "<leader>gd", group = "Diffview" },
        { "<leader>gc", group = "Git Conflict" },
      },
    },
  },
}
