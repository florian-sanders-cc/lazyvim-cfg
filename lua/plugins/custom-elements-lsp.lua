return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      ---@type lspconfig.options.custom_elements_ls
      custom_elements_ls = {
        filetypes = {
          "html",
          "javascript",
          "typescript",
        },
      },
    },
  },
}
