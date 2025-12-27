return {
  -- Gruvbox (warm, retro) - RECOMMENDED
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        contrast = "hard", -- or "soft" or ""
        transparent_mode = false,
      })
    end,
  },

  -- Kanagawa (Japanese-inspired, warm) - RECOMMENDED
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        theme = "dragon", -- or "wave" or "lotus"
        background = {
          dark = "dragon",
        },
      })
    end,
  },

  -- TokyoNight (clean dark gray) - RECOMMENDED
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night", -- or "storm", "moon", "day"
      })
    end,
  },

  -- Catppuccin (soft pastels)
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- or "macchiato", "frappe", "latte"
      })
    end,
  },

  -- Rose Pine (soft, low contrast)
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        variant = "moon", -- or "main", "dawn"
      })
    end,
  },

  -- Nightfox (multiple clean variants)
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nightfox").setup({
        options = {
          transparent = false,
        },
      })
    end,
  },

  -- Everforest (forest-inspired)
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.everforest_background = 'hard' -- or 'medium', 'soft'
      vim.g.everforest_better_performance = 1
    end,
  },

  -- Configure LazyVim default colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa-dragon", -- Change to: gruvbox, tokyonight-night, catppuccin, rose-pine, carbonfox, everforest
    },
  },
}