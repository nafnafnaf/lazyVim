return {
  -- Telescope configuration
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = {
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({
            cwd = require("lazy.core.config").options.root,
          })
        end,
        desc = "Find Plugin File",
      },
      {
        "<leader>fc",
        "<cmd>Telescope colorscheme<cr>",
        desc = "Find Colorscheme",
      },
    },
  },
}
