-- Import base LazyVim plugins FIRST, then extras
return {
  -- Base LazyVim plugins (must be first)
  { "LazyVim/LazyVim", import = "lazyvim.plugins" },
  
  -- Language support
  { import = "lazyvim.plugins.extras.lang.python" },
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "lazyvim.plugins.extras.lang.go" },
  { import = "lazyvim.plugins.extras.lang.rust" },
  { import = "lazyvim.plugins.extras.lang.docker" },
  { import = "lazyvim.plugins.extras.lang.yaml" },
}
