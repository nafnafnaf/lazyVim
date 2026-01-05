return {
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
    keys = {
      {
        "<leader>gg",
        function()
          vim.cmd("terminal toolbox run -c dev lazygit")
        end,
        desc = "LazyGit",
      },
    },
  },
}
