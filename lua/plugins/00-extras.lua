-- Import base LazyVim plugins FIRST, then extras
return {
  -- Base LazyVim plugins (must be first)
  { "LazyVim/LazyVim", import = "lazyvim.plugins" },
  
  -- Then LazyVim extras
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.json" },
}
