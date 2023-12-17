if true then
  return {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        ---@type lspconfig.options.tsserver
        tsserver = {
          settings = {
            implicitProjectConfiguration = {
              checkJs = true,
            },
            javascript = {
              validate = {
                enabled = true,
              },
            },
          },
        },
      },
    },
  }
end
return {
  -- add typescript to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "typescript", "tsx" })
      end
    end,
  },

  -- correctly setup lspconfig
  {
    "pmizio/typescript-tools.nvim",
    opts = {

      settings = {
        expose_as_code_action = "all",
        tsserver_file_preferences = {
          preferTypeOnlyAutoImports = true,
          quotePreference = "auto",
          importModuleSpecifierEnding = "js",
          jsxAttributeCompletionStyle = "auto",
          allowTextChangesInNewFiles = true,
          providePrefixAndSuffixTextForRename = true,
          allowRenameOfImportPath = true,
          includeAutomaticOptionalChainCompletions = true,
          provideRefactorNotApplicableReason = true,
          generateReturnInDocTemplate = true,
          includeCompletionsForImportStatements = true,
          includeCompletionsWithSnippetText = true,
          includeCompletionsWithClassMemberSnippets = true,
          includeCompletionsWithObjectLiteralMethodSnippets = true,
          useLabelDetailsInCompletionEntries = true,
          allowIncompleteCompletions = true,
          displayPartsForJSDoc = true,
          disableLineTextInReferences = true,
          includeInlayVariableTypeHintsWhenTypeMatchesName = true,
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
        tsserver_format_preferences = {
          preferTypeOnlyAutoImports = true,
          insertSpaceAfterCommaDelimiter = true,
          insertSpaceAfterConstructor = false,
          insertSpaceAfterSemicolonInForStatements = true,
          insertSpaceBeforeAndAfterBinaryOperators = true,
          insertSpaceAfterKeywordsInControlFlowStatements = true,
          insertSpaceAfterFunctionKeywordForAnonymousFunctions = true,
          insertSpaceBeforeFunctionParenthesis = false,
          insertSpaceAfterOpeningAndBeforeClosingNonemptyParenthesis = false,
          insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets = false,
          insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = true,
          insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = true,
          insertSpaceAfterOpeningAndBeforeClosingTemplateStringBraces = false,
          insertSpaceAfterOpeningAndBeforeClosingJsxExpressionBraces = false,
          insertSpaceAfterTypeAssertion = false,
          placeOpenBraceOnNewLineForFunctions = false,
          placeOpenBraceOnNewLineForControlBlocks = false,
          semicolons = "ignore",
          indentSwitchCase = true,
        },
        complete_function_calls = true,
        implicitProjectConfig = {
          module = "ESNext",
          target = "ES2022",
          strictNullChecks = true,
          strictFunctionTypes = true,
          experimentalDecorators = false,
          checkJs = true,
        },
        tsserver_plugins = {
          "typescript-lit-html-plugin",
          "lit-ts-plugin",
        },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "neovim/nvim-lspconfig",
        opts = {
          -- make sure mason installs the server
          servers = {
            tsserver = {
              enabled = false,
            },
          },
        },
      },
    },
    event = "VeryLazy",
  },
}
