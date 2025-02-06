local enabled = false

return {
  {
    "tris203/precognition.nvim",
    opts = function()
      local precognition = require("precognition")
      Snacks.toggle({
        name = "Precognition",
        get = function()
          return enabled
        end,
        set = function(state)
          precognition.toggle()
          enabled = state
        end,
      }):map("<leader>uP")

      return { startVisible = enabled }
    end,

    event = "BufEnter",
    disabled_filetypes = { "qf", "netrw", "NvimTree", "lazy", "mason", "oil" },
    keys = {
      {
        "<leader>uP",
        function()
          if require("precognition").toggle() then
            LazyVim.info("Precognition is on")
          else
            LazyVim.warn("Precognition is off")
          end
        end,
        desc = "toggle Precognition",
      },
    },
  },
}
