return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      emmet_language_server = {
        enable = true,
      },
    },
  },
}
