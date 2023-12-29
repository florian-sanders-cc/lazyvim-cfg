if true then
  return {}
end
return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    servers = {
      volar = {
        filetypes = { "javascript", "typescript" },
      },
    },
  },
}
