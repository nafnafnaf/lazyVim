# LazyVim Internal Structure Guide

## 📁 File Structure Overview

```
~/.config/nvim/                    # Your Neovim config root
│
├── init.lua                       # Entry point - loads LazyVim
├── lazy-lock.json                 # Plugin versions lock file
│
├── lua/
│   ├── config/                    # Core configuration (auto-loaded)
│   │   ├── autocmds.lua          # Auto-commands
│   │   ├── keymaps.lua           # Your custom keymaps
│   │   ├── lazy.lua              # Lazy.nvim bootstrap & setup
│   │   └── options.lua           # Vim options
│   │
│   ├── plugins/                   # Plugin configurations (auto-loaded)
│   │   ├── 00-extras.lua         # LazyVim language extras imports
│   │   ├── 01-colorscheme.lua    # Colorscheme plugins
│   │   ├── 02-editor.lua         # Telescope config
│   │   ├── 03-lsp.lua            # LSP servers
│   │   ├── 05-neotree-config.lua # Neo-tree settings
│   │   ├── 06-enable-dashboard.lua # Dashboard config
│   │   └── 10-languages.lua      # Additional language parsers
│   │
│   └── custom/                    # Your old custom stuff (not auto-loaded)
│       └── init.lua              # (Moved to config/keymaps.lua)
│
└── .gitignore                     # Git ignore file
```

## 🔄 How It Loads (Order of Execution)

1. **`init.lua`** - Neovim starts here
2. **`lua/config/lazy.lua`** - Bootstraps Lazy.nvim plugin manager
3. **Lazy.nvim loads:**
   - `lazyvim.plugins` (base LazyVim plugins)
   - Everything from `lua/plugins/*.lua` (alphabetically)
4. **`lua/config/options.lua`** - Vim settings
5. **`lua/config/keymaps.lua`** - Your keybindings
6. **`lua/config/autocmds.lua`** - Auto-commands

## 📦 Where Plugins Are Actually Installed

```
~/.local/share/nvim/lazy/          # Actual plugin code (git clones)
├── LazyVim/                       # LazyVim core
├── nvim-treesitter/               # Syntax highlighting
├── tokyonight.nvim/               # Colorscheme
├── catppuccin/                    # Colorscheme
├── neo-tree.nvim/                 # File explorer
├── telescope.nvim/                # Fuzzy finder
└── ... (all your other plugins)
```

## 🎨 How Colorschemes Work

1. **Installation:** `lua/plugins/01-colorscheme.lua` tells Lazy to install colorscheme plugins
2. **Storage:** Plugins downloaded to `~/.local/share/nvim/lazy/`
3. **Activation:** LazyVim reads `colorscheme = "tokyonight-night"` and loads it
4. **Switching:** `:colorscheme name` changes theme temporarily

## 🔧 How Language Support Works

**Two-part system:**

1. **LazyVim Extras** (`00-extras.lua`):
   ```lua
   { import = "lazyvim.plugins.extras.lang.python" }
   ```
   - Imports pre-configured bundles (LSP + Tree-sitter + formatters)

2. **Custom Tree-sitter** (`10-languages.lua`):
   ```lua
   ensure_installed = { "bash", "bicep", ... }
   ```
   - Adds additional language parsers for syntax highlighting

## 🗺️ Key Files Explained

### `lua/config/lazy.lua`
- Bootstraps Lazy.nvim
- Defines what to load: `{ "LazyVim/LazyVim", import = "lazyvim.plugins" }`
- Sets colorscheme fallbacks

### `lua/plugins/*.lua`
- Each file returns a table of plugin specs
- Lazy automatically loads ALL `.lua` files in this directory
- **Numbering (00-, 01-, etc.)** controls load order

### `lazy-lock.json`
- Locks plugin versions for reproducibility
- Commit this to git!
- Ensures same versions on different machines

## 🎯 How Your Custom Settings Work

### Keymaps (`lua/config/keymaps.lua`)
- Loaded automatically by LazyVim
- Your `<leader>3p` and `<leader>tt` live here

### Plugin Overrides (`lua/plugins/*.lua`)
- Each file can **override** or **extend** LazyVim defaults
- Example: Your `01-colorscheme.lua` **adds** new colorschemes

## 🔍 How to Find What's Loaded

```vim
:Lazy           # See all plugins
:checkhealth    # Verify everything works
:LspInfo        # See active LSP servers
:TSInstallInfo  # See Tree-sitter parsers
:colorscheme    # See current theme
```

## 📝 Configuration Flow Example

When you open a Python file:

1. **File detection:** Neovim detects `.py` extension
2. **LSP starts:** Python language server (from `00-extras.lua`)
3. **Tree-sitter loads:** Python parser for syntax highlighting
4. **Colorscheme applies:** TokyoNight colors the syntax
5. **Keymaps active:** Your custom `<leader>tt` works
6. **Auto-commands fire:** Terminal enters insert mode automatically

## 🎨 Theme System

Your setup has **4 colorschemes installed**:
- TokyoNight (default)
- Catppuccin
- Kanagawa
- Solarized-Osaka

Stored in: `~/.local/share/nvim/lazy/{theme-name}/colors/`

## 💡 Key Principles

1. **`lua/config/`** = Auto-loaded core settings
2. **`lua/plugins/`** = Auto-loaded plugin configs
3. **Numbered files** = Control load order
4. **Lazy.nvim** = Manages all plugin installation/loading
5. **LazyVim extras** = Pre-configured bundles for languages

## 🚀 Quick Reference

### Essential Keymaps
- `Space + e` - Toggle file tree
- `Space + 3 + p` - 3-pane layout
- `Space + t + t` - Terminal (bottom split)
- `Ctrl + /` - Floating terminal
- `Ctrl + h/j/k/l` - Navigate between windows

### Essential Commands
- `:Lazy` - Plugin manager
- `:Lazy sync` - Update/install plugins
- `:Lazy clean` - Remove unused plugins
- `:colorscheme <name>` - Switch themes
- `:e <file>` - Open file
🎉🎉
### File Navigation
- `Space + f + f` - Find files
- `Space + f + g` - Find text (grep)
- `Space + f + r` - Recent files

---

*This is your complete LazyVim setup guide - keep it handy!
