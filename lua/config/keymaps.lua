-- Efficiency-focused keymaps
-- Place this file at: ~/.config/nvim/lua/config/keymaps.lua

local map = vim.keymap.set

-- ============================================================================
-- INSERT MODE - Quick exit
-- ============================================================================

-- Exit insert mode with jk (most efficient)
map("i", "jk", "<Esc>", { desc = "Exit insert mode" })
map("i", "kj", "<Esc>", { desc = "Exit insert mode (alternative)" })

-- ============================================================================
-- NORMAL MODE - Essential actions
-- ============================================================================

-- Quick save
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })

-- Quick quit
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit window" })
map("n", "<leader>Q", "<cmd>qa<CR>", { desc = "Quit all" })

-- Better window navigation (stay on home row)
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize windows with Ctrl + arrows (when needed)
map("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })

-- Buffer navigation
map("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })
map("n", "<leader>bD", "<cmd>bdelete!<CR>", { desc = "Force delete buffer" })

-- Clear search highlighting
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- Better indenting (stay in visual mode)
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })

-- Move lines up/down (visual mode)
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Keep cursor centered when scrolling
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up (centered)" })

-- Keep search results centered
map("n", "n", "nzzzv", { desc = "Next search result (centered)" })
map("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })

-- ============================================================================
-- TERMINAL MODE - Quick escape
-- ============================================================================

-- Exit terminal mode easily
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
map("t", "jk", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Terminal navigation (same as normal mode)
map("t", "<C-h>", "<cmd>wincmd h<CR>", { desc = "Go to left window" })
map("t", "<C-j>", "<cmd>wincmd j<CR>", { desc = "Go to lower window" })
map("t", "<C-k>", "<cmd>wincmd k<CR>", { desc = "Go to upper window" })
map("t", "<C-l>", "<cmd>wincmd l<CR>", { desc = "Go to right window" })

-- ============================================================================
-- COMMAND MODE - Use semicolon instead of colon (one less keypress)
-- ============================================================================

map("n", ";", ":", { desc = "Enter command mode" })
map("v", ";", ":", { desc = "Enter command mode" })

-- ============================================================================
-- DIAGNOSTICS - Quick access
-- ============================================================================

map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Show diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })

-- ============================================================================
-- LSP - Code actions (when LSP is active)
-- ============================================================================

map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "gr", vim.lsp.buf.references, { desc = "Show references" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })

-- ============================================================================
-- CUSTOM - Additional efficiency keymaps
-- ============================================================================

-- Quick write and quit
map("n", "<leader>wq", "<cmd>wq<CR>", { desc = "Save and quit" })

-- Select all
map("n", "<C-a>", "ggVG", { desc = "Select all" })

-- Paste without yanking in visual mode
map("v", "p", '"_dP', { desc = "Paste without yank" })

-- Delete without yanking
map({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yank" })

-- Yank to system clipboard
map({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to clipboard" })
map("n", "<leader>Y", '"+Y', { desc = "Yank line to clipboard" })

-- ============================================================================
-- CUSTOM LAYOUTS
-- ============================================================================

-- 3-pane layout (tree + editor + terminal)
map("n", "<leader>3p", function()
  -- Close all windows except current
  vim.cmd("only")
  
  -- Open Neo-tree on left
  vim.cmd("Neotree position=left")
  
  -- Focus back to main window
  vim.cmd("wincmd l")
  
  -- Open terminal at bottom
  vim.cmd("split")
  vim.cmd("wincmd j")
  vim.cmd("terminal")
  vim.cmd("resize 15")
  
  -- Focus back to editor
  vim.cmd("wincmd k")
end, { desc = "3-pane layout (tree + editor + terminal)" })
