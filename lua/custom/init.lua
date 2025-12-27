-- Custom keymaps and settings
vim.opt.termguicolors = true

-- Terminal keymap
vim.keymap.set("n", "<leader>tt", ":terminal<CR>", { desc = "Open terminal" })

-- Easy escape from terminal mode
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- Auto-enter insert mode in terminal
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.cmd("startinsert")
  end,
})
