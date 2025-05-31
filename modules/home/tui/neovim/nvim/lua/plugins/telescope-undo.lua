return {
  "debugloop/telescope-undo.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("telescope").load_extension("undo")
  end,
  keys = {
    { "<leader>su", "<cmd>Telescope undo<cr>", mode = "n", desc = "Undotree" },
  },
}
