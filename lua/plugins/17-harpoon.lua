-- Harpoon - Pin and quickly switch between frequent files
-- Place this file at: ~/.config/nvim/lua/plugins/17-harpoon.lua

return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      -- ========================================================================
      -- PIN/UNPIN FILES
      -- ========================================================================
      
      -- Add current file to harpoon (pin it)
      {
        "<leader>ha",
        function()
          require("harpoon"):list():add()
          vim.notify("File added to Harpoon", vim.log.levels.INFO)
        end,
        desc = "Harpoon: Add file",
      },
      
      -- Remove current file from harpoon
      {
        "<leader>hr",
        function()
          require("harpoon"):list():remove()
          vim.notify("File removed from Harpoon", vim.log.levels.INFO)
        end,
        desc = "Harpoon: Remove file",
      },
      
      -- ========================================================================
      -- VIEW PINNED FILES
      -- ========================================================================
      
      -- Show harpoon menu (see all pinned files)
      {
        "<leader>hh",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Harpoon: Toggle menu",
      },
      
      -- Alternative - show with Telescope (nicer UI)
      {
        "<leader>hm",
        "<cmd>Telescope harpoon marks<cr>",
        desc = "Harpoon: Show in Telescope",
      },
      
      -- ========================================================================
      -- QUICK NAVIGATION (Jump to pinned files instantly)
      -- ========================================================================
      
      -- Jump to 1st pinned file
      {
        "<leader>1",
        function()
          require("harpoon"):list():select(1)
        end,
        desc = "Harpoon: File 1",
      },
      
      -- Jump to 2nd pinned file
      {
        "<leader>2",
        function()
          require("harpoon"):list():select(2)
        end,
        desc = "Harpoon: File 2",
      },
      
      -- Jump to 3rd pinned file
      {
        "<leader>3",
        function()
          require("harpoon"):list():select(3)
        end,
        desc = "Harpoon: File 3",
      },
      
      -- Jump to 4th pinned file
      {
        "<leader>4",
        function()
          require("harpoon"):list():select(4)
        end,
        desc = "Harpoon: File 4",
      },
      
      -- Jump to 5th pinned file
      {
        "<leader>5",
        function()
          require("harpoon"):list():select(5)
        end,
        desc = "Harpoon: File 5",
      },
      
      -- ========================================================================
      -- CYCLE THROUGH PINNED FILES
      -- ========================================================================
      
      -- Next pinned file
      {
        "<C-S-n>",
        function()
          require("harpoon"):list():next()
        end,
        desc = "Harpoon: Next file",
      },
      
      -- Previous pinned file
      {
        "<C-S-p>",
        function()
          require("harpoon"):list():prev()
        end,
        desc = "Harpoon: Previous file",
      },
    },
    
    opts = {
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
        key = function()
          -- Per-project harpoon lists based on git root or cwd
          return vim.loop.cwd()
        end,
      },
    },
    
    config = function(_, opts)
      local harpoon = require("harpoon")
      harpoon:setup(opts)
      
      -- Extend Telescope with harpoon
      local conf = require("telescope.config").values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end
        
        require("telescope.pickers")
          .new({}, {
            prompt_title = "Harpoon",
            finder = require("telescope.finders").new_table({
              results = file_paths,
            }),
            previewer = conf.file_previewer({}),
            sorter = conf.generic_sorter({}),
          })
          :find()
      end
      
      vim.keymap.set("n", "<leader>hm", function()
        toggle_telescope(harpoon:list())
      end, { desc = "Harpoon: Open in Telescope" })
    end,
  },
  
  -- Telescope integration for Harpoon
  {
    "nvim-telescope/telescope.nvim",
    optional = true,
    opts = function()
      pcall(require("telescope").load_extension, "harpoon")
    end,
  },
}
