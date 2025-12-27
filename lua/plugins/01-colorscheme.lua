return {
  -- Solarized Osaka
  {
    "craftzdog/solarized-osaka.nvim",
    branch = "osaka",
    lazy = false,
    priority = 1000,
  },

  -- TokyoNight - VS Code style with FULL Tree-sitter support
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
    },
  },

  -- Catppuccin - Excellent Tree-sitter support
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "mocha",
    },
  },

  -- Kanagawa - Beautiful Tree-sitter colors
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
  },

  -- Set default
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },
}
