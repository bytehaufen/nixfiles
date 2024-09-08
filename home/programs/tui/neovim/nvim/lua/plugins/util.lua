return {
  -- git diff view
  {
    "sindrets/diffview.nvim",
    dependencies = {
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
    cmd = "DiffviewOpen",
    keys = {
      { "<leader>gdd", mode = { "n" }, "<cmd>DiffviewOpen<cr>", desc = "Diffview Open" },
      { "<leader>gdh", mode = { "n" }, "<cmd>DiffviewFileHistory<cr>", desc = "Diffview File History" },
      { "<leader>gdq", mode = { "n" }, "<cmd>DiffviewClose<cr>", desc = "Diffview Close" },
      { "<leader>gde", mode = { "n" }, "<cmd>DiffviewToggleFiles<cr>", desc = "Diffview Toggle Files" },
    },
  },
  {
    "gennaro-tedesco/nvim-jqx",
    ft = { "json", "yaml" },
  },
}
