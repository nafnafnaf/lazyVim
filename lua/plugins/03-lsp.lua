return {
  -- LSP servers
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {},
        ts_ls = {},
      },
    },
  },
}
