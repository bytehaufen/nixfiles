-- Fixes Autocomment
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  command = "set fo-=c fo-=r fo-=o",
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "dap-float",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "dap-terminal",
  },
  callback = function(event)
    vim.keymap.set("n", "q", "<cmd>bdelete!<cr>", { buffer = event.buf, silent = true })
  end,
})

-- Disable spellcheck for symbols-outline
vim.api.nvim_create_autocmd("Filetype", {
  pattern = {
    "Outline",
  },
  callback = function()
    vim.opt.spell = false
  end,
})

-- Fix c/cpp comments
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_config_" .. name, { clear = true })
end
vim.api.nvim_create_autocmd("Filetype", {
  group = augroup("commentstring"),
  pattern = { "c", "cpp", "cc", "h", "hh", "hpp" },
  callback = function()
    vim.opt.commentstring = "// %s"
  end,
  desc = "Change commentstring for c/c++ files",
})
