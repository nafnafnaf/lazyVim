-- Oil.nvim - Edit filesystem like a buffer
-- Place this file at: ~/.config/nvim/lua/plugins/18-oil.lua

return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      -- Open Oil in current directory
      {
        "<leader>o",
        function()
          require("oil").open()
        end,
        desc = "Oil: Open parent directory",
      },
      
      -- Open Oil in float (overlay window)
      {
        "<leader>O",
        function()
          require("oil").open_float()
        end,
        desc = "Oil: Open in float",
      },
    },
    
    opts = {
      -- Columns to display
      columns = {
        "icon",
        -- "permissions",
        -- "size",
        -- "mtime",
      },
      
      -- Send deleted files to trash instead of permanent delete
      delete_to_trash = true,
      
      -- Skip confirmation for simple operations
      skip_confirm_for_simple_edits = true,
      
      -- Restore window options when leaving Oil buffer
      restore_win_options = true,
      
      -- Keymaps in Oil buffer
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-v>"] = "actions.select_vsplit",
        ["<C-x>"] = "actions.select_split",
        ["<C-t>"] = "actions.select_tab",
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["<C-l>"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["gs"] = "actions.change_sort",
        ["gx"] = "actions.open_external",
        ["g."] = "actions.toggle_hidden",
        ["g\\"] = "actions.toggle_trash",
      },
      
      -- Use Telescope for external file selection
      use_default_keymaps = true,
      
      -- Window options
      view_options = {
        -- Show hidden files by default
        show_hidden = false,
        
        -- Sort order
        sort = {
          { "type", "asc" },  -- Directories first
          { "name", "asc" },  -- Then alphabetically
        },
      },
      
      -- Float window options
      float = {
        padding = 2,
        max_width = 90,
        max_height = 30,
        border = "rounded",
        win_options = {
          winblend = 0,
        },
      },
    },
    
    config = function(_, opts)
      require("oil").setup(opts)
    end,
  },
}
