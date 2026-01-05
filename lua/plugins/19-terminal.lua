-- Floating Terminal with Toolbox integration
-- Place this file at: ~/.config/nvim/lua/plugins/19-terminal.lua

return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      -- ========================================================================
      -- TOGGLE TERMINALS
      -- ========================================================================
      
      -- Toggle floating terminal
      {
        "<leader>t",
        "<cmd>ToggleTerm direction=float<cr>",
        desc = "Terminal: Toggle float",
        mode = { "n", "t" },
      },
      
      -- Toggle horizontal terminal (bottom split)
      {
        "<leader>tt",
        "<cmd>ToggleTerm direction=horizontal size=15<cr>",
        desc = "Terminal: Toggle horizontal",
        mode = { "n", "t" },
      },
      
      -- Toggle vertical terminal (right split)
      {
        "<leader>tv",
        "<cmd>ToggleTerm direction=vertical size=80<cr>",
        desc = "Terminal: Toggle vertical",
        mode = { "n", "t" },
      },
      
      -- ========================================================================
      -- MULTIPLE TERMINALS (numbered terminals)
      -- ========================================================================
      
      -- Terminal 1
      {
        "<leader>t1",
        "<cmd>1ToggleTerm direction=float<cr>",
        desc = "Terminal: Toggle 1",
        mode = { "n", "t" },
      },
      
      -- Terminal 2
      {
        "<leader>t2",
        "<cmd>2ToggleTerm direction=float<cr>",
        desc = "Terminal: Toggle 2",
        mode = { "n", "t" },
      },
      
      -- Terminal 3
      {
        "<leader>t3",
        "<cmd>3ToggleTerm direction=float<cr>",
        desc = "Terminal: Toggle 3",
        mode = { "n", "t" },
      },
      
      -- ========================================================================
      -- TOOLBOX TERMINALS (quick access to dev toolbox)
      -- ========================================================================
      
      -- Open terminal directly in dev toolbox
      {
        "<leader>td",
        function()
          local Terminal = require("toggleterm.terminal").Terminal
          local toolbox = Terminal:new({
            cmd = "toolbox enter dev",
            direction = "float",
            close_on_exit = false,
            on_open = function(term)
              vim.cmd("startinsert!")
              vim.notify("Entered dev toolbox", vim.log.levels.INFO)
            end,
          })
          toolbox:toggle()
        end,
        desc = "Terminal: Dev toolbox",
        mode = { "n", "t" },
      },
      
      -- ========================================================================
      -- SPECIALIZED TERMINALS
      -- ========================================================================
      
      -- Python REPL in toolbox
      {
        "<leader>tp",
        function()
          local Terminal = require("toggleterm.terminal").Terminal
          local python = Terminal:new({
            cmd = "toolbox run -c dev python3",
            direction = "float",
            close_on_exit = false,
          })
          python:toggle()
        end,
        desc = "Terminal: Python REPL",
      },
      
      -- Node REPL in toolbox
      {
        "<leader>tn",
        function()
          local Terminal = require("toggleterm.terminal").Terminal
          local node = Terminal:new({
            cmd = "toolbox run -c dev node",
            direction = "float",
            close_on_exit = false,
          })
          node:toggle()
        end,
        desc = "Terminal: Node REPL",
      },
      
      -- LazyGit in toolbox
      {
        "<leader>tg",
        function()
          local Terminal = require("toggleterm.terminal").Terminal
          local lazygit = Terminal:new({
            cmd = "toolbox run -c dev lazygit",
            direction = "float",
            close_on_exit = true,
            float_opts = {
              width = function()
                return math.floor(vim.o.columns * 0.95)
              end,
              height = function()
                return math.floor(vim.o.lines * 0.95)
              end,
            },
          })
          lazygit:toggle()
        end,
        desc = "Terminal: LazyGit",
      },
      
      -- Htop in toolbox
      {
        "<leader>th",
        function()
          local Terminal = require("toggleterm.terminal").Terminal
          local htop = Terminal:new({
            cmd = "toolbox run -c dev htop",
            direction = "float",
            close_on_exit = true,
          })
          htop:toggle()
        end,
        desc = "Terminal: Htop",
      },
    },
    
    opts = {
      -- Size
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      
      -- Open in insert mode
      start_in_insert = true,
      
      -- Terminal shell
      shell = vim.o.shell,
      
      -- Persist terminal size
      persist_size = true,
      persist_mode = true,
      
      -- Close terminal on process exit
      close_on_exit = true,
      
      -- Auto scroll to bottom
      auto_scroll = true,
      
      -- Float terminal options
      float_opts = {
        border = "curved",
        width = function()
          return math.floor(vim.o.columns * 0.8)
        end,
        height = function()
          return math.floor(vim.o.lines * 0.8)
        end,
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
      
      -- Shade inactive terminals
      shading_factor = 2,
      
      -- Direction: 'vertical' | 'horizontal' | 'tab' | 'float'
      direction = "float",
      
      -- Hide line numbers in terminal
      on_open = function(term)
        vim.cmd("startinsert!")
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.opt_local.signcolumn = "no"
      end,
    },
    
    config = function(_, opts)
      require("toggleterm").setup(opts)
      
      -- Terminal specific keymaps
      function _G.set_terminal_keymaps()
        local opts_map = { buffer = 0 }
        -- Exit terminal mode easily
        vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts_map)
        vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts_map)
        -- Window navigation from terminal
        vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts_map)
        vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts_map)
        vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts_map)
        vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts_map)
      end
      
      -- Apply terminal keymaps when terminal opens
      vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
    end,
  },
}
