return {
  { -- QoL features for folding
    "chrisgrieser/nvim-origami",
    event = "VeryLazy",
    opts = {
      keepFoldsAcrossSessions = true,
      pauseFoldsOnSearch = true,
      foldKeymaps = {
        setup = true,
        hOnlyOpensOnFirstColumn = true,
      },
    },
  },
}
