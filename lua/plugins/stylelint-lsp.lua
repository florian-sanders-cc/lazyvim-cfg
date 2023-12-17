return {
  -- add stylelint to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        ---@type lspconfig.options.stylelint_lsp
        stylelint_lsp = {
          settings = {
            stylelintplus = {
              autoFixOnSave = true,
              autoFixOnFormat = true,
              configFile = "/home/flo/Projects/clever-components/stylelint.config.json",
              cssInJs = true,
              customSyntax = "@stylelint/postcss-css-in-js",
              validate = {
                "css",
                "less",
                "postcss",
                "javascript",
                "typescript",
              },
            },
          },
        },
      },
    },
  },
}
