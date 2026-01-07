return {
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
    keys = {
      {
        "<leader>gg",
        function()
          vim.cmd("terminal lazygit")
        end,
        desc = "LazyGit",
      },
    },
  },
}
