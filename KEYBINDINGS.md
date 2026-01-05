# LazyVim Efficiency Setup - Keybinding Cheatsheet

**Last Updated:** January 2026

---

## 🎯 Most Important (Memorize First)

| Key | Action | Usage |
|-----|--------|-------|
| `jk` or `kj` | Exit insert mode | Replace Esc - use 1000x/day |
| `Space Space` | Find files | Your #1 action - use 100x/day |
| `Space ,` | Switch buffers | Quick file switching |
| `s` + 2 chars | Jump to word | Jump anywhere on screen |
| `Space t` | Toggle terminal | Instant floating terminal |
| `;` | Command mode | Instead of `:` (one less key) |
| `Space w` | Save file | Quick save |
| `Space q` | Quit window | Quick quit |

---

## 📁 File & Buffer Management

### Telescope (Universal Finder)

| Key | Action | Description |
|-----|--------|-------------|
| `Space Space` | Find files | Fuzzy find any file |
| `Space f f` | Find files (alt) | Alternative binding |
| `Space f g` | Find git files | Only git-tracked files |
| `Space f F` | Find all files | Including hidden files |
| `Space f r` | Recent files | Recently opened files |
| `Space ,` | Switch buffers | See all open buffers |
| `Space f b` | Find buffers | Alternative buffer list |

**Inside Telescope:**
- `Ctrl+j/k` or `Ctrl+n/p` - Navigate results
- `Enter` - Open file
- `Ctrl+x` - Open in horizontal split
- `Ctrl+v` - Open in vertical split
- `Ctrl+d` - Delete buffer (in buffer list)
- `Esc` - Close Telescope

### Buffer Actions

| Key | Action | Description |
|-----|--------|-------------|
| `Space b d` | Delete buffer | Close current buffer |
| `Space b D` | Force delete buffer | Close without saving |
| `Shift+h` | Previous buffer | Go to previous buffer |
| `Shift+l` | Next buffer | Go to next buffer |

### Harpoon (Pin Files)

| Key | Action | Description |
|-----|--------|-------------|
| `Space h a` | Add to harpoon | Pin current file |
| `Space h r` | Remove from harpoon | Unpin current file |
| `Space h h` | Harpoon menu | View all pinned files |
| `Space h m` | Harpoon in Telescope | Prettier view |
| `Space 1` | Jump to file 1 | First pinned file |
| `Space 2` | Jump to file 2 | Second pinned file |
| `Space 3` | Jump to file 3 | Third pinned file |
| `Space 4` | Jump to file 4 | Fourth pinned file |
| `Space 5` | Jump to file 5 | Fifth pinned file |
| `Ctrl+Shift+n` | Next harpoon file | Cycle forward |
| `Ctrl+Shift+p` | Previous harpoon file | Cycle backward |

### Oil (Edit Filesystem)

| Key | Action | Description |
|-----|--------|-------------|
| `Space o` | Open Oil | Edit filesystem like buffer |
| `Space O` | Open Oil (float) | Floating window |

**Inside Oil:**
- `Enter` - Open file/enter directory
- `-` - Go to parent directory
- `i` - Insert mode (edit filesystem)
- `dd` - Delete file/directory
- `p` - Paste (move files)
- `Space w` - Save changes (apply operations)
| `g.` - Toggle hidden files
- `g?` - Show help
- `Ctrl+c` - Close Oil

---

## 🔍 Search & Navigation

### Text Search

| Key | Action | Description |
|-----|--------|-------------|
| `Space /` | Search in file | Fuzzy find in current file |
| `Space s g` | Live grep | Search text in all files |
| `Space s w` | Search word | Search word under cursor |
| `n` | Next result | Jump to next (centered) |
| `N` | Previous result | Jump to previous (centered) |
| `Esc` | Clear highlight | Remove search highlighting |

### Hop (Jump to Location)

| Key | Action | Description |
|-----|--------|-------------|
| `s` + 2 chars | Jump to word | Jump anywhere (2 char search) |
| `S` + 1 char | Jump to word | Jump anywhere (1 char search) |
| `Space j` | Jump to line | Jump to any line |
| `Space J` | Jump to line start | Jump to first non-whitespace |
| `Space h p` | Jump to pattern | Jump to regex pattern |
| `Space h v` | Jump vertically | Jump in same column |

### Window Navigation

| Key | Action | Description |
|-----|--------|-------------|
| `Ctrl+h` | Left window | Move to left window |
| `Ctrl+j` | Down window | Move to bottom window |
| `Ctrl+k` | Up window | Move to top window |
| `Ctrl+l` | Right window | Move to right window |

### Scrolling

| Key | Action | Description |
|-----|--------|-------------|
| `Ctrl+d` | Scroll down | Half page down (centered) |
| `Ctrl+u` | Scroll up | Half page up (centered) |
| `Ctrl+f` | Page down | Full page down |
| `Ctrl+b` | Page up | Full page up |

---

## 💻 Terminal

### Toggle Terminals

| Key | Action | Description |
|-----|--------|-------------|
| `Space t` | Float terminal | Floating terminal (main) |
| `Space t t` | Horizontal terminal | Bottom split terminal |
| `Space t v` | Vertical terminal | Right split terminal |
| `Space t 1` | Terminal 1 | Numbered terminal 1 |
| `Space t 2` | Terminal 2 | Numbered terminal 2 |
| `Space t 3` | Terminal 3 | Numbered terminal 3 |

### Toolbox Terminals

| Key | Action | Description |
|-----|--------|-------------|
| `Space t d` | Dev toolbox | Auto-enter dev toolbox |
| `Space t p` | Python REPL | Python in toolbox |
| `Space t n` | Node REPL | Node.js in toolbox |
| `Space t g` | LazyGit | LazyGit fullscreen |
| `Space t h` | Htop | Process monitor |

**Inside Terminal:**
- `Esc` or `jk` - Exit terminal mode
- `Ctrl+h/j/k/l` - Navigate to other windows
- `Space t` (again) - Hide terminal (persists)

---

## ✏️ Editing

### Insert Mode

| Key | Action | Description |
|-----|--------|-------------|
| `i` | Insert before cursor | Normal insert |
| `a` | Insert after cursor | Append |
| `I` | Insert at line start | Start of line |
| `A` | Insert at line end | End of line |
| `o` | New line below | Insert line below |
| `O` | New line above | Insert line above |
| `jk` or `kj` | Exit insert mode | **Use this, not Esc!** |

### Surround

| Key | Action | Description |
|-----|--------|-------------|
| `ysiw"` | Surround word | word → "word" |
| `yss)` | Surround line | Wrap line in () |
| `cs"'` | Change surround | "word" → 'word' |
| `ds"` | Delete surround | "word" → word |
| `S"` (visual) | Surround selection | Wrap selection in "" |

### Comment

| Key | Action | Description |
|-----|--------|-------------|
| `gcc` | Toggle line comment | Comment/uncomment line |
| `gbc` | Toggle block comment | Block comment |
| `gc` (visual) | Comment selection | Comment selected lines |

### Auto-Pairs

- Type `(` → automatically adds `)`
- Type `"` → automatically adds `"`
- Delete `(` → deletes matching `)`

### Copy/Paste

| Key | Action | Description |
|-----|--------|-------------|
| `yy` | Yank line | Copy line |
| `dd` | Delete line | Cut line |
| `p` | Paste after | Paste after cursor |
| `P` | Paste before | Paste before cursor |
| `Space y` | Yank to clipboard | Copy to system clipboard |
| `Space Y` | Yank line to clipboard | Copy line to system |
| `Space d` | Delete no yank | Delete without copying |

### Visual Mode

| Key | Action | Description |
|-----|--------|-------------|
| `v` | Visual mode | Character selection |
| `V` | Visual line | Line selection |
| `Ctrl+v` | Visual block | Block selection |
| `<` | Indent left | Decrease indent (stays in visual) |
| `>` | Indent right | Increase indent (stays in visual) |
| `J` | Move down | Move selected lines down |
| `K` | Move up | Move selected lines up |

---

## 🔧 Code Actions (LSP)

| Key | Action | Description |
|-----|--------|-------------|
| `Space c a` | Code action | Show available actions |
| `Space r n` | Rename | Rename symbol |
| `gd` | Go to definition | Jump to definition |
| `gr` | Show references | Show all references |
| `K` | Hover docs | Show documentation |
| `Space c d` | Show diagnostic | Show error/warning |
| `]d` | Next diagnostic | Next error/warning |
| `[d` | Previous diagnostic | Previous error/warning |

---

## 📊 Git Integration

| Key | Action | Description |
|-----|--------|-------------|
| `Space g g` | LazyGit | Open LazyGit |
| `Space g c` | Git commits | Browse commits |
| `Space g s` | Git status | Git status in Telescope |
| `Space g b` | Git branches | Switch branches |

**Inside LazyGit (Space g g):**
- `Space` - Stage/unstage file
- `a` - Stage all
- `c` then `c` - Commit
- `P` then `p` - Push
- `p` - Pull
- `q` - Quit

---

## 🎨 Appearance

| Key | Action | Description |
|-----|--------|-------------|
| `Space f C` | Colorschemes | Live preview themes |
| `zR` | Open all folds | Expand all code folds |
| `zM` | Close all folds | Collapse all code folds |

---

## 🔍 Help & Documentation

| Key | Action | Description |
|-----|--------|-------------|
| `Space f h` | Find help | Search Neovim help |
| `Space f k` | Find keymaps | See all keybindings |
| `Space f c` | Find commands | Search commands |
| `Space f M` | Man pages | Browse man pages |

---

## 🚀 Quick Workflows

### Open Project and Start Coding
```
1. nvim                    # Start Neovim
2. Space Space             # Find main file
3. Space h a               # Pin it (harpoon)
4. Space Space             # Find another file
5. Space h a               # Pin it
6. Now: Space 1/2 to switch instantly!
```

### Search and Replace Workflow
```
1. Space s g               # Search text across files
2. Enter on result         # Open file
3. n / N                   # Navigate results
4. ciw new_text Esc        # Change word
5. . (dot)                 # Repeat on next match
```

### Terminal Workflow
```
1. nvim                    # Edit code
2. Space t d               # Dev toolbox terminal
3. python script.py        # Run code
4. Esc                     # Exit terminal mode
5. Space t d               # Hide terminal
6. Continue editing...
7. Space t d               # Show terminal again
```

### Jump Around Workflow
```
1. See word "function" far away
2. Press: s fu
3. Labels appear: a b c d
4. Press: b
5. You're at "function"!
```

### Rename Files in Bulk (Oil)
```
1. Space o                 # Open Oil
2. i                       # Insert mode
3. Edit filenames like text
4. Space w                 # Save (renames happen!)
```

---

## 💡 Tips

- **Muscle memory takes 2-3 days** - Especially for `jk` instead of Esc
- **Use Space Space for everything** - Don't use file tree, use Telescope
- **Pin your top 4-5 files** - Use Harpoon, not buffer switching
- **Learn Hop gradually** - Start with `s` for jumping, learn others later
- **Terminal persists** - `Space t` hides it, doesn't close it
- **Semicolon for commands** - `;` instead of `:` saves one keypress

---

## 🆘 Emergency Commands

| Situation | Command | Description |
|-----------|---------|-------------|
| Lost in buffer | `Space ,` | See all buffers |
| Can't find file | `Space Space` | Find files |
| Need help | `Space f h` | Search help |
| Keybinding not working | `Space f k` | See all keymaps |
| Plugin error | `:Lazy sync` | Sync plugins |
| Something broken | `:checkhealth` | Check health |
| Undo everything | `u` many times | Undo changes |
| Quit without save | `:q!` | Force quit |

---

## 📝 Notes

- All `Space` keybindings work in **normal mode**
- Terminal keybindings work in both **normal and terminal mode**
- `jk` works in **insert and terminal mode**
- Visual mode uses different keybindings (noted where applicable)
- When in doubt, press `Space` and wait - Which-key will show options!

---

**Save this file as:** `~/.config/nvim/KEYBINDINGS.md`

**Quick reference:** Open with `nvim ~/.config/nvim/KEYBINDINGS.md`
