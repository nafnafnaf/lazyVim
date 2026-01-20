-- Hop - Jump to any visible location with 2-3 keystrokes
-- Place this file at: ~/.config/nvim/lua/plugins/16-hop.lua

return {
  {
    "smoka7/hop.nvim",
    version = "*",
    event = "VeryLazy",
    keys = {
      -- ========================================================================
      -- JUMP TO ANY WORD (Most used - easiest keys)
      -- ========================================================================
      
      -- Jump to any word on screen (2 character search)
      {
        "s",
        function()
          require("hop").hint_char2()
        end,
        mode = { "n", "v" },
        desc = "Hop to word (2 chars)",
      },
      
      -- Jump to any word with 1 character
      {
        "S",
        function()
          require("hop").hint_char1()
        end,
        mode = { "n", "v" },
        desc = "Hop to word (1 char)",
      },
      
      -- ========================================================================
      -- JUMP TO LINES
      -- ========================================================================
      
      -- Jump to any line
      {
        "<leader>j",
        function()
          require("hop").hint_lines()
        end,
        mode = { "n", "v" },
        desc = "Hop to line",
      },
      
      -- Jump to line start
      {
        "<leader>J",
        function()
          require("hop").hint_lines_skip_whitespace()
        end,
        mode = { "n", "v" },
        desc = "Hop to line start",
      },
      
      -- ========================================================================
      -- JUMP TO PATTERNS
      -- ========================================================================
      
      -- Jump to any pattern (regex search then jump)
      {
        "<leader>hp",
        function()
          require("hop").hint_patterns()
        end,
        mode = { "n", "v" },
        desc = "Hop to pattern",
      },
      
      -- ========================================================================
      -- VERTICAL JUMPS (up/down only)
      -- ========================================================================
      
      -- Jump vertically (same column, different lines)
      {
        "<leader>hv",
        function()
          require("hop").hint_vertical()
        end,
        mode = { "n", "v" },
        desc = "Hop vertically",
      },
    },
    
    opts = {
      -- Keys to use for jump labels (home row prioritized)
      keys = "asdfjkl;ghqweruiop",
      
      -- Make labels easier to see
      uppercase_labels = true,
      
      -- Jump on first character if unambiguous
      jump_on_sole_occurrence = true,
      
      -- Case sensitivity
      case_insensitive = true,
      
      -- Multi-windows support
      multi_windows = true,
    },
    
    config = function(_, opts)
      require("hop").setup(opts)
    end,
  },
}
