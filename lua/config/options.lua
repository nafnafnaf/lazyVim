-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Fix PATH for GUI sessions
vim.env.PATH = vim.env.PATH .. ":/usr/local/go/bin:" .. vim.env.HOME .. "/go/bin:" .. vim.env.HOME .. "/.cargo/bin:" .. vim.env.HOME .. "/.local/bin"
