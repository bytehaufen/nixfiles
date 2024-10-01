--- Function to toggle autocompletion of nvim-cmp
-- Relates to https://github.com/hrsh7th/nvim-cmp/issues/261#issuecomment-929790943
local function toggle_autocomplete()
  local cmp = require("cmp")
  local autocomplete = cmp.get_config().completion.autocomplete == false and false or { cmp.TriggerEvent.TextChanged }
  cmp.setup({
    completion = {
      autocomplete = autocomplete,
    },
  })
  if autocomplete == false then
    vim.notify("Auto completion is disabled")
  else
    vim.notify("Auto completion is enabled")
  end
end
vim.api.nvim_create_user_command("CmpToggle", toggle_autocomplete, {})

return {
  "nvim-cmp",
  opts = {
    completion = {
      -- Default: Disable autocompletion
      autocomplete = false,
    },
  },
  keys = {
    { "<leader>uk", ":CmpToggle<CR>", mode = "n", desc = "Toggle Auto Completion" },
  },
}
