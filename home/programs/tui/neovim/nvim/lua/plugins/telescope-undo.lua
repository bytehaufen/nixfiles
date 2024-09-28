return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "debugloop/telescope-undo.nvim",
  },
  config = function()
    require("telescope").load_extension("undo")
  end,
  keys = {
    { "<leader>su", "<cmd>Telescope undo<cr>", mode = "n", desc = "Undotree" },
  },
}
