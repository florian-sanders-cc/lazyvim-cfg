if true then
  return {}
end
-- disabled for now conflicts with stylelint lsp + I would like it to only suggest within a lit template
return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      ---@type lspconfig.options.emmet_language_server
      emmet_language_server = {
        enabled = false,
        filetypes = {
          "css",
          "html",
          "less",
          "pug",
          "sass",
          "scss",
          "javascript",
          "typescript",
        },
      },
    },
  },
}
