#!/bin/bash

echo "🚀 Setting up LazyVim on this machine..."

# Install Homebrew if not installed
if ! command -v brew &> /dev/null; then
    echo "📦 Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install Neovim
echo "📝 Installing Neovim..."
brew install neovim

# Install iTerm2
echo "🖥️  Installing iTerm2..."
brew install --cask iterm2

# Install Nerd Font
echo "🔤 Installing Nerd Font..."
brew install font-fira-code-nerd-font

# Install fd and ripgrep (for better search)
echo "🔍 Installing search tools..."
brew install fd ripgrep

echo "✅ Installation complete!"
echo ""
echo "Next steps:"
echo "1. Open iTerm2"
echo "2. Configure iTerm2: Settings → Profiles → Text → Font → FiraCode Nerd Font Mono"
echo "3. Configure iTerm2: Settings → Profiles → Colors → Solarized Dark"
echo "4. Run: nvim"
echo "5. Wait for plugins to install automatically"
echo ""
echo "🎉 Enjoy your LazyVim setup!"
