# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

# LazyVim Configuration

My personal LazyVim configuration for Neovim, optimized for multi-language development with a beautiful GUI experience via Neovide.

## Features

- **Multiple Colorschemes**: TokyoNight (default), Catppuccin, Kanagawa, Solarized-Osaka
- **Multi-Language Support**: Python, TypeScript, JavaScript, Go, Rust, Bash, HTML, CSS, YAML, PowerShell, Bicep, Docker
- **Syntax Highlighting**: Tree-sitter powered syntax highlighting for all languages
- **LSP Integration**: Full Language Server Protocol support with auto-completion
- **Beautiful GUI**: Neovide with smooth animations and GPU acceleration
- **Custom Keybindings**: 3-pane layout, terminal integration, window navigation
- **Git Integration**: LazyGit for visual git workflows
- **File Explorer**: Neo-tree with custom navigation
- **Fuzzy Finding**: Telescope for fast file and text search

## Quick Start

### Prerequisites

- macOS (tested on Apple Silicon M1+)
- Homebrew package manager
- Git

### Installation

```bash
# Clone this repository
git clone https://github.com/YOUR_USERNAME/nvim-config.git ~/.config/nvim

# Run the installation script
cd ~/.config/nvim
./install.sh

# Start Neovim
nvim
```

Plugins will install automatically on first launch.

## Manual Installation Steps

If you prefer to install components manually:

### 1. Install Core Dependencies

```bash
# Install Neovim
brew install neovim

# Install iTerm2 (recommended terminal)
brew install --cask iterm2

# Install Neovide (GUI)
brew install --cask neovide

# Install Nerd Font
brew install font-fira-code-nerd-font

# Install search tools
brew install fd ripgrep

# Install LazyGit
brew install lazygit
```

### 2. Configure iTerm2

1. Open iTerm2 Settings (Cmd + ,)
2. Go to Profiles > Colors
3. Choose "Solarized Dark" from Color Presets
4. Go to Profiles > Text
5. Set Font to "FiraCode Nerd Font Mono", size 13-14
6. Click "Set as Default"

### 3. Clone Configuration

```bash
git clone https://github.com/YOUR_USERNAME/nvim-config.git ~/.config/nvim
```

### 4. Start Neovim

```bash
nvim
```

Wait for Lazy.nvim to install all plugins automatically.

## Configuration Structure

```
~/.config/nvim/
├── init.lua                    # Entry point
├── lazy-lock.json              # Plugin version lock file
├── lua/
│   ├── config/                 # Core configuration
│   │   ├── autocmds.lua       # Auto-commands
│   │   ├── keymaps.lua        # Custom keybindings
│   │   ├── lazy.lua           # Lazy.nvim bootstrap
│   │   └── options.lua        # Vim options
│   └── plugins/               # Plugin configurations
│       ├── 00-extras.lua      # Language extras
│       ├── 01-colorscheme.lua # Colorschemes
│       ├── 02-editor.lua      # Telescope
│       ├── 03-lsp.lua         # LSP servers
│       ├── 05-neotree-config.lua # File explorer
│       ├── 06-enable-dashboard.lua # Dashboard
│       ├── 10-languages.lua   # Additional languages
│       └── 12-lazygit.lua     # Git integration
└── install.sh                 # Installation script
```

## Keybindings

### Essential Shortcuts

| Shortcut | Action | Description |
|----------|--------|-------------|
| `Space + e` | Toggle file tree | Open/close Neo-tree |
| `Space + 3 + p` | 3-pane layout | Tree + Editor + Terminal |
| `Space + t + t` | Toggle terminal | Bottom split terminal |
| `Ctrl + /` | Floating terminal | LazyVim's floating terminal |
| `Space + g + g` | LazyGit | Open git interface |

### Window Navigation

| Shortcut | Action |
|----------|--------|
| `Ctrl + h` | Move to left window |
| `Ctrl + j` | Move to bottom window |
| `Ctrl + k` | Move to top window |
| `Ctrl + l` | Move to right window |

### File Operations

| Shortcut | Action |
|----------|--------|
| `Space + f + f` | Find files (Telescope) |
| `Space + f + g` | Find text (grep) |
| `Space + f + r` | Recent files |
| `Space + f + c` | Find colorscheme |

### Neo-tree (File Explorer)

| Key | Action |
|-----|--------|
| `a` | Add new file |
| `d` | Delete file |
| `r` | Rename file |
| `c` | Change root to folder |
| `u` | Go up one directory |
| `?` | Show all commands |

### LazyGit Workflow

| Key | Action |
|-----|--------|
| `Space` | Stage/unstage file |
| `a` | Stage all files |
| `c` then `c` | Commit |
| `P` then `p` | Push to remote |
| `p` | Pull from remote |
| `q` | Quit LazyGit |

### Terminal Mode

| Key | Action |
|-----|--------|
| `Esc` | Exit insert mode |
| `Ctrl + h/j/k/l` | Navigate to other windows |

## Language Support

The following languages have full LSP, Tree-sitter, and formatting support:

- **Python**: pyright LSP, ruff formatter
- **TypeScript/JavaScript**: typescript-language-server
- **Go**: gopls LSP
- **Rust**: rust-analyzer LSP
- **HTML/CSS**: vscode-langservers-extracted
- **YAML**: yaml-language-server
- **JSON**: vscode-langservers-extracted
- **Bash**: bash-language-server
- **Docker**: dockerfile-language-server
- **PowerShell**: PowerShell Editor Services
- **Bicep**: bicep-langserver

## Colorschemes

Switch colorschemes with `:colorscheme <name>` or use Telescope (`Space + f + c`)

Available themes:
- `tokyonight-night` (default) - VS Code inspired dark theme
- `catppuccin-mocha` - Soft pastel colors
- `kanagawa` - Japanese inspired palette
- `solarized-osaka` - Solarized variant

To change the default colorscheme, edit `lua/plugins/01-colorscheme.lua`:

```lua
{
  "LazyVim/LazyVim",
  opts = {
    colorscheme = "your-preferred-theme",
  },
}
```

## Using Neovide

Neovide provides a native macOS GUI with smooth animations and better font rendering.

### Launch Neovide

```bash
# Open in current directory
neovide

# Open specific directory
neovide ~/.config/nvim

# With custom config directory
cd ~/my-project
neovide
```

### Neovide-Specific Settings

Add to `lua/config/options.lua`:

```lua
if vim.g.neovide then
  vim.g.neovide_cursor_animation_length = 0.05
  vim.g.neovide_cursor_trail_size = 0.3
  vim.g.neovide_refresh_rate = 60
  vim.g.neovide_transparency = 0.95
  vim.o.guifont = "FiraCode Nerd Font Mono:h14"
end
```

## Customization

### Adding More Languages

Edit `lua/plugins/00-extras.lua` to add LazyVim language extras:

```lua
return {
  { "LazyVim/LazyVim", import = "lazyvim.plugins" },
  { import = "lazyvim.plugins.extras.lang.python" },
  { import = "lazyvim.plugins.extras.lang.your-language" },
}
```

Or add Tree-sitter parsers in `lua/plugins/10-languages.lua`:

```lua
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed or {}, {
        "your-language",
      })
    end,
  },
}
```

### Adding Custom Keybindings

Edit `lua/config/keymaps.lua`:

```lua
vim.keymap.set("n", "<leader>custom", ":YourCommand<CR>", { desc = "Description" })
```

### Installing Additional Plugins

Create a new file in `lua/plugins/` directory:

```lua
-- lua/plugins/my-plugin.lua
return {
  {
    "author/plugin-name",
    opts = {
      -- plugin configuration
    },
  },
}
```

Then run `:Lazy sync` to install.

## Troubleshooting

### Plugins Not Installing

```vim
:Lazy clean
:Lazy sync
```

Then restart Neovim.

### Syntax Highlighting Not Working

Check if Tree-sitter parsers are installed:

```vim
:checkhealth nvim-treesitter
```

### LSP Not Working

Check LSP status:

```vim
:LspInfo
:checkhealth lsp
```

### Neovide Performance Issues

Adjust animation settings in `lua/config/options.lua`:

```lua
if vim.g.neovide then
  vim.g.neovide_cursor_animation_length = 0.01  -- Faster
  vim.g.neovide_refresh_rate = 60               -- Lower FPS
end
```

## Learning Resources

### Vim Basics
- [OpenVim Tutorial](https://www.openvim.com/)
- [Vim Adventures](https://vim-adventures.com/)
- [Vim Cheat Sheet](https://vim.rtorr.com/)

### LazyVim
- [LazyVim Documentation](https://www.lazyvim.org/)
- [LazyVim GitHub](https://github.com/LazyVim/LazyVim)

### Neovim
- [Neovim Documentation](https://neovim.io/doc/)
- [Learn Vim the Smart Way](https://github.com/iggredible/Learn-Vim)

## Contributing

This is a personal configuration, but feel free to:
- Fork this repository
- Create issues for bugs or suggestions
- Submit pull requests with improvements

## Acknowledgments

- [LazyVim](https://github.com/LazyVim/LazyVim) - The amazing Neovim distribution
- [Neovide](https://github.com/neovide/neovide) - Beautiful GUI for Neovim
- [Neovim](https://neovim.io/) - Hyperextensible Vim-based text editor

## License

MIT License - Feel free to use this configuration for your own setup.

## Journey

This configuration represents my journey learning Vim/Neovim and transitioning to a keyboard-driven development workflow. Started as a complete beginner, now building muscle memory and improving efficiency every day.

### Milestones

- Switched from GUI editors to Neovim
- Learned modal editing concepts
- Configured LazyVim from scratch
- Integrated Neovide for GUI experience
- Set up multi-language development environment
- Integrated git workflows with LazyGit

---

**Last Updated**: December 2025
