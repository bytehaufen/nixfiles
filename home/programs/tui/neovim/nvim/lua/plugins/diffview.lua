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

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts_extend = { "spec" },
    opts = {
      spec = {
        mode = { "n", "v" },
        { "<leader>gd", group = "Diffview" },
      },
    },
  },
}
