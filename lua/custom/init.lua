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

-- 3-pane layout helper
vim.keymap.set("n", "<leader>3p", function()
  -- Close all windows except current
  vim.cmd("only")
  
  -- Open Neo-tree on the left
  vim.cmd("Neotree show left")
  
  -- Move back to main window
  vim.cmd("wincmd l")
  
  -- Split bottom for terminal
  vim.cmd("split")
  vim.cmd("wincmd J")
  vim.cmd("resize 15")
  vim.cmd("terminal")
  
  -- Return to main editor window
  vim.cmd("wincmd k")
end, { desc = "Open 3-pane layout (tree + editor + terminal)" })
