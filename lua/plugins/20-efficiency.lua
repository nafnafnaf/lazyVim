-- Final Efficiency Tweaks
-- Place this file at: ~/.config/nvim/lua/plugins/20-efficiency.lua

return {
  -- ========================================================================
  -- AUTO-CLOSE UNUSED BUFFERS
  -- ========================================================================
  {
    "axkirillov/hbac.nvim",
    event = "VeryLazy",
    opts = {
      -- Auto-close buffers not used in X minutes
      autoclose = true,
      threshold = 10, -- Minutes of inactivity before auto-close
      
      -- Keep these buffers open always
      close_command = function(bufnr)
        vim.api.nvim_buf_delete(bufnr, {})
      end,
      
      -- Don't close special buffers
      close_buffers_with_windows = false,
    },
    config = function(_, opts)
      require("hbac").setup(opts)
    end,
  },
  
  -- ========================================================================
  -- BETTER QUICKFIX/LOCATION LIST
  -- ========================================================================
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    opts = {
      auto_resize_height = true,
      preview = {
        auto_preview = true,
        win_height = 12,
        win_vheight = 12,
        border = "rounded",
      },
      func_map = {
        vsplit = "",
        ptogglemode = "z,",
        stoggleup = "",
      },
    },
  },
  
  -- ========================================================================
  -- INDENT GUIDES (Visual indent lines)
  -- ========================================================================
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    main = "ibl",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
      },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
      },
    },
  },
  
  -- ========================================================================
  -- SMOOTH SCROLLING
  -- ========================================================================
  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    opts = {
      mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "zt", "zz", "zb" },
      hide_cursor = true,
      stop_eof = true,
      respect_scrolloff = false,
      cursor_scrolls_alone = true,
      easing_function = "quadratic",
      performance_mode = false,
    },
    config = function(_, opts)
      require("neoscroll").setup(opts)
    end,
  },
  
  -- ========================================================================
  -- AUTO-SAVE (Save on focus lost or buffer switch)
  -- ========================================================================
  {
    "pocco81/auto-save.nvim",
    event = "VeryLazy",
    opts = {
      enabled = true,
      trigger_events = { "InsertLeave", "TextChanged" },
      condition = function(buf)
        local fn = vim.fn
        local utils = require("auto-save.utils.data")
        
        -- Don't auto-save special buffers
        if fn.getbufvar(buf, "&modifiable") == 1 and utils.not_in(fn.getbufvar(buf, "&filetype"), {
          "oil",
          "neo-tree",
          "lazy",
          "mason",
        }) then
          return true
        end
        return false
      end,
      write_all_buffers = false,
      debounce_delay = 135,
    },
    config = function(_, opts)
      require("auto-save").setup(opts)
    end,
  },
  
  -- ========================================================================
  -- BETTER FOLDING (Code folding with treesitter)
  -- ========================================================================
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    event = "VeryLazy",
    keys = {
      {
        "zR",
        function()
          require("ufo").openAllFolds()
        end,
        desc = "Open all folds",
      },
      {
        "zM",
        function()
          require("ufo").closeAllFolds()
        end,
        desc = "Close all folds",
      },
      {
        "zr",
        function()
          require("ufo").openFoldsExceptKinds()
        end,
        desc = "Open folds except kinds",
      },
      {
        "zm",
        function()
          require("ufo").closeFoldsWith()
        end,
        desc = "Close folds with",
      },
    },
    opts = {
      provider_selector = function()
        return { "treesitter", "indent" }
      end,
    },
    init = function()
      vim.o.foldcolumn = "0"
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
    end,
  },
  
  -- ========================================================================
  -- HIGHLIGHT YANKED TEXT (Visual feedback on yank)
  -- ========================================================================
  {
    "vim-scripts/ReplaceWithRegister",
    event = "VeryLazy",
  },
  
  -- ========================================================================
  -- AUTO-PAIRS (Auto-close brackets, quotes, etc.)
  -- ========================================================================
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts = true, -- Use treesitter
      ts_config = {
        lua = { "string" },
        javascript = { "template_string" },
      },
      disable_filetype = { "TelescopePrompt", "vim" },
      fast_wrap = {
        map = "<M-e>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = [=[[%'%"%)%>%]%)%}%,]]=],
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "Search",
        highlight_grey = "Comment",
      },
    },
  },
  
  -- ========================================================================
  -- SURROUND (Add/change/delete surrounding chars)
  -- ========================================================================
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",

  },
  
  -- ========================================================================
  -- COMMENT (Toggle comments easily)
  -- ========================================================================
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {
      padding = true,
      sticky = true,
      toggler = {
        line = "gcc",
        block = "gbc",
      },
      opleader = {
        line = "gc",
        block = "gb",
      },
      mappings = {
        basic = true,
        extra = true,
      },
    },
  },
  
  -- ========================================================================
  -- WHICH-KEY (Show available keybindings) - SIMPLIFIED
  -- ========================================================================
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      -- Extend LazyVim's which-key config
      opts.spec = opts.spec or {}
      vim.list_extend(opts.spec, {
        { "<leader>3", group = "layout" },
      })
      return opts
    end,
  },
  
  -- ========================================================================
  -- BETTER ESCAPE (No delay when pressing jk)
  -- ========================================================================
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    opts = {
      mapping = { "jk", "kj" },
      timeout = 200,
      clear_empty_lines = false,
      keys = "<Esc>",
    },
  },
}
