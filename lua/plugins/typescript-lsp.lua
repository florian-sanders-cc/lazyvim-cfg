local HOME = os.getenv("HOME")

-- vim.lsp.set_log_level("debug")

if true then
  return {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      servers = {
        ---@type lspconfig.options.tsserver
        tsserver = {
          on_new_config = function(new_config, new_root_dir)
            if string.find(new_root_dir, "console3") then
              new_config.init_options = {
                hostInfo = "neovim",
                tsserver = {
                  path = HOME .. "/.volta/tools/image/packages/typescript/lib/node_modules/typescript/lib/tsserver.js",
                },
              }
            end
          end,
          filetypes = { "javascript", "typescript" },
          settings = {
            implicitProjectConfiguration = { checkJs = true, allowJs = true },
            fallbackPath = HOME .. ".volta/tools/image/packages/typescript/lib/node_modules/typescript/lib/tsserver.js",
            importModuleSpecifierEnding = "js",
            tsserver_plugins = {},
            javascript = {
              validate = {
                enabled = true,
              },
              preferences = {
                quoteStyle = "single",
                renameMatchingJsxTags = true,
              },
              format = {
                enable = true,
                semicolons = "insert",
                insertSpaceBeforeFunctionParenthesis = true,
              },
              suggest = {
                completeFunctionCalls = false,
              },
              updateImportsOnFileMove = true,
              preferGoToSourceDefinition = true,
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
        complete_function_calls = true,
        -- spawn additional tsserver instance to calculate diagnostics on it
        separate_diagnostic_server = true,
        -- "change"|"insert_leave" determine when the client asks the server about diagnostic
        publish_diagnostic_on = "insert_leave",
        tsserver_max_memory = "auto",
        code_lens = "off",
        disable_member_code_lens = true,
        expose_as_code_action = "all",
        -- tsserver_path = "/home/flo/.volta/tools/image/packages/typescript/lib/node_modules/typescript/lib/tsserver.js",
        -- tsserver_plugins = {
        --   "ts-lit-plugin",
        -- },
        tsserver_file_preferences = {
          preferTypeOnlyAutoImports = false,
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
          includeInlayVariableTypeHintsWhenTypeMatchesName = false,
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = false,
          includeInlayVariableTypeHints = false,
          includeInlayPropertyDeclarationTypeHints = false,
          includeInlayFunctionLikeReturnTypeHints = false,
          includeInlayEnumMemberValueHints = false,
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
        -- the 3 entries below are not working, TODO: check later
        implicitProjectConfiguration = {
          module = "NodeNext",
          target = "ES2021",
          strictNullChecks = true,
          strictFunctionTypes = true,
          experimentalDecorators = false,
          noImplicitAny = false,
          checkJs = true,
          allowJs = true,
        },
        implicitProjectConfig = {
          module = "NodeNext",
          moduleResolution = "node",
          target = "ES2021",
          noImplicitAny = false,
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
