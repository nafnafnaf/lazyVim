return {
  -- Treesitter configuration for syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- Languages you want
        "python",
        "bash",
        "bicep",
        
        -- Common useful languages
        "lua",
        "vim",
        "vimdoc",
        "markdown",
        "markdown_inline",
        "json",
        "yaml",
        "toml",
        "regex",
        
        -- Add more as needed:
         "go",
        "rust",
        "javascript",
        "typescript",
        "html",
        "css",
        "dockerfile",
      },
      
      -- Auto-install missing parsers when entering buffer
      auto_install = true,
      
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      
      indent = {
        enable = true,
      },
    },
  },
}
