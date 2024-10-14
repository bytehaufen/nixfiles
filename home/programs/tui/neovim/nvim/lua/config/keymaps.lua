-- btop
if vim.fn.executable("btop") == 1 then
  vim.keymap.set("n", "<leader>xb", function()
    require("lazyvim.util").terminal.open({ "btop" })
  end, { desc = "btop" })
end

-- Exit insert mode with jk
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true, desc = "<Esc>" })

-- Activate Tmux seemless navigating
vim.keymap.del("n", "<C-h>")
vim.keymap.del("n", "<C-j>")
vim.keymap.del("n", "<C-k>")
vim.keymap.del("n", "<C-l>")
vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>")
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>")
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>")
