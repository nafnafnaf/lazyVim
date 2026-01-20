-- Enhanced Telescope configuration
-- Place this file at: ~/.config/nvim/lua/plugins/15-telescope.lua

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    keys = {
      -- ========================================================================
      -- ESSENTIAL FINDERS (Most used - easiest keys)
      -- ========================================================================
      
      -- Find files (THE most important action)
      { "<leader><leader>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      
      -- Find in current file
      { "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Search in file" },
      
      -- Switch buffers (open files)
      { "<leader>,", "<cmd>Telescope buffers<cr>", desc = "Switch buffers" },
      
      -- Live grep (search text in all files)
      { "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Search text (grep)" },
      
      -- Recent files
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
      
      -- ========================================================================
      -- FILE FINDERS
      -- ========================================================================
      
      -- Find files (alternative)
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      
      -- Find git files only (faster in git repos)
      { "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Find git files" },
      
      -- Find all files (including hidden)
      { "<leader>fF", "<cmd>Telescope find_files hidden=true no_ignore=true<cr>", desc = "Find all files" },
      
      -- ========================================================================
      -- TEXT SEARCH
      -- ========================================================================
      
      -- Search word under cursor
      { "<leader>sw", "<cmd>Telescope grep_string<cr>", desc = "Search word under cursor" },
      
      -- ========================================================================
      -- BUFFER/WINDOW MANAGEMENT
      -- ========================================================================
      
      -- Show all buffers with delete capability
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
      
      -- Show marks
      { "<leader>fm", "<cmd>Telescope marks<cr>", desc = "Find marks" },
      
      -- ========================================================================
      -- GIT INTEGRATION
      -- ========================================================================
      
      -- Git commits
      { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Git commits" },
      
      -- Git status
      { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git status" },
      
      -- Git branches
      { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Git branches" },
      
      -- ========================================================================
      -- HELP & DOCUMENTATION
      -- ========================================================================
      
      -- Help tags (search vim help)
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find help" },
      
      -- Man pages
      { "<leader>fM", "<cmd>Telescope man_pages<cr>", desc = "Man pages" },
      
      -- Keymaps (see all keybindings)
      { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Find keymaps" },
      
      -- Commands
      { "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Find commands" },
      
      -- ========================================================================
      -- COLORSCHEMES
      -- ========================================================================
      
      -- Live preview colorschemes
      { "<leader>fC", "<cmd>Telescope colorscheme<cr>", desc = "Colorschemes" },
      
      -- ========================================================================
      -- LSP & DIAGNOSTICS
      -- ========================================================================
      
      -- Document symbols (functions, variables, etc.)
      { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document symbols" },
      
      -- Workspace symbols
      { "<leader>fS", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Workspace symbols" },
      
      -- Diagnostics
      { "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
      
      -- ========================================================================
      -- RESUME LAST SEARCH
      -- ========================================================================
      
      -- Resume last telescope picker
      { "<leader>f<leader>", "<cmd>Telescope resume<cr>", desc = "Resume last search" },
    },
    
    opts = function()
      local actions = require("telescope.actions")
      
      return {
        defaults = {
          -- Layout
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              preview_width = 0.55,
              results_width = 0.8,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
          
          -- Behavior
          prompt_prefix = "🔍 ",
          selection_caret = "➤ ",
          path_display = { "truncate" },
          
          -- File ignores
          file_ignore_patterns = {
            "node_modules",
            ".git/",
            "dist/",
            "build/",
            "target/",
            "%.lock",
          },
          
          -- Sorting
          sorting_strategy = "ascending",
          
          -- Keymaps within Telescope
          mappings = {
            i = {
              -- Navigation
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-n>"] = actions.move_selection_next,
              ["<C-p>"] = actions.move_selection_previous,
              
              -- Close Telescope
              ["<C-c>"] = actions.close,
              ["<Esc>"] = actions.close,
              
              -- Scroll preview
              ["<C-u>"] = actions.preview_scrolling_up,
              ["<C-d>"] = actions.preview_scrolling_down,
              
              -- Open in split/vsplit
              ["<C-x>"] = actions.select_horizontal,
              ["<C-v>"] = actions.select_vertical,
              
              -- Delete buffer (when in buffer list)
              ["<C-d>"] = actions.delete_buffer,
              
              -- Send to quickfix
              ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            },
            n = {
              -- Navigation (normal mode)
              ["j"] = actions.move_selection_next,
              ["k"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              
              -- Close
              ["q"] = actions.close,
              ["<Esc>"] = actions.close,
              
              -- Open
              ["<CR>"] = actions.select_default,
              ["<C-x>"] = actions.select_horizontal,
              ["<C-v>"] = actions.select_vertical,
              
              -- Delete buffer
              ["dd"] = actions.delete_buffer,
            },
          },
        },
        
        pickers = {
          find_files = {
            hidden = false,
            -- Don't specify find_command, let Telescope use default
          },
          
          buffers = {
            sort_lastused = true,
            sort_mru = true,
            mappings = {
              i = {
                ["<C-d>"] = actions.delete_buffer,
              },
              n = {
                ["dd"] = actions.delete_buffer,
              },
            },
          },
          
          live_grep = {
            additional_args = function()
              return { "--hidden" }
            end,
          },
        },
        
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      }
    end,
    
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      
      -- Load fzf extension for faster fuzzy finding
      telescope.load_extension("fzf")
    end,
  },
}
