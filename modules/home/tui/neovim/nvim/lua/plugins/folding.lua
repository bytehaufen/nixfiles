return {
  { -- QoL features for folding
    "chrisgrieser/nvim-origami",
    dependencies = { "kevinhwang91/nvim-ufo" },
    event = "VeryLazy",
    opts = {
      foldKeymaps = {
        setup = true,
        hOnlyOpensOnFirstColumn = true,
      },
      autoFold = {
        enabled = true,
        kinds = { "imports" }, ---@type lsp.FoldingRangeKind[]
      },
    },
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      { "kevinhwang91/promise-async" },
    },
  },
}
