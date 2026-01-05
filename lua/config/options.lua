-- Efficiency-focused Neovim options
-- Place this file at: ~/.config/nvim/lua/config/options.lua

local opt = vim.opt

-- Line numbers - Relative for quick jumps
opt.relativenumber = true  -- Show relative line numbers
opt.number = true           -- Show absolute line number on cursor line

-- Cursor & Visual feedback
opt.cursorline = true       -- Highlight current line
opt.scrolloff = 8           -- Keep 8 lines visible above/below cursor
opt.sidescrolloff = 8       -- Keep 8 columns visible left/right

-- Indentation visualization
opt.list = true             -- Show invisible characters
opt.listchars = {
  tab = "→ ",
  trail = "·",
  extends = "»",
  precedes = "«",
  nbsp = "␣",
}

-- Search settings
opt.ignorecase = true       -- Ignore case in search
opt.smartcase = true        -- Unless uppercase is used
opt.hlsearch = true         -- Highlight search results
opt.incsearch = true        -- Show matches while typing

-- Performance
opt.updatetime = 250        -- Faster completion & diagnostics
opt.timeoutlen = 300        -- Faster which-key popup

-- Split behavior
opt.splitright = true       -- Vertical splits go right
opt.splitbelow = true       -- Horizontal splits go below

-- Disable mouse (force keyboard efficiency)
opt.mouse = ""              -- No mouse support

-- Swap and backup
opt.swapfile = false        -- No swap files
opt.backup = false          -- No backup files
opt.undofile = true         -- Persistent undo

-- Command line
opt.cmdheight = 1           -- Single line for commands
opt.showcmd = false         -- Don't show partial commands

-- Completion menu
opt.pumheight = 10          -- Popup menu height (10 items max)

-- Neovide-specific settings (if running in Neovide)
if vim.g.neovide then
  vim.g.neovide_cursor_animation_length = 0.05
  vim.g.neovide_cursor_trail_size = 0.3
  vim.g.neovide_refresh_rate = 60
  vim.o.guifont = "FiraCode Nerd Font Mono:h13"
end

-- Leader key (already set by LazyVim but confirming)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
