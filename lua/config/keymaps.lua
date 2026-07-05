-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Terminal keymap
vim.keymap.set("n", "<leader>tt", ":terminal<CR>", { desc = "Open terminal" })

-- Easy escape from terminal mode
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- 3-pane layout
vim.keymap.set("n", "<leader>3p", function()
  vim.cmd("only")
  vim.cmd("Neotree show position=left")
  vim.cmd("wincmd l")
  vim.cmd("split")
  vim.cmd("wincmd J")
  vim.cmd("resize 12")
  vim.cmd("terminal")
  vim.cmd("wincmd k")
end, { desc = "Open 3-pane layout" })

-- Execute current file in terminal (without moving to it)
vim.keymap.set("n", "<leader>x", function()
  local file = vim.fn.expand("%:p")
  local cmd = string.format("chmod +x %s && %s\n", file, file)
  -- Find terminal buffer and send command
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[buf].buftype == "terminal" then
      vim.api.nvim_chan_send(vim.b[buf].terminal_job_id, cmd)
      return
    end
  end
  vim.notify("No terminal found. Open one with <leader>tt", vim.log.levels.WARN)
end, { desc = "Execute current file" })
