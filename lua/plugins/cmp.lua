if true then
  return {}
end
-- I would like to only get emmet suggestions within a lit template but I don't know how to do this right now.
return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "dcampos/cmp-emmet-vim",
  },
  opts = function(_, opts)
    table.insert(opts.sources, {
      name = "nvim_lsp",
      entry_filter = function(entry, ctx)
        local io = require("io")
        -- only show emmet snippets in lit-like templates
        -- closes the open file
        local file = io.open("/home/flo/log-nvim.log", "a")
        -- appends a word test to the last line of the file
        file:write("-- End of the test.lua file")
        -- if
        --   require("cmp.types").lsp.CompletionItemKind[entry:get_kind()] == "Snippet"
        --   and entry.source:get_debug_name() == "nvim_lsp:emmet_ls"
        -- then
        --   return ctx.in_treesitter_capture("lit_html")
        -- else
        --   return true
        -- end
      end,
    })
  end,
  -- table.insert(opts.sources, {
  --   name = "emmet_vim",
  --   option = {
  --     filetypes = {
  --       "css",
  --       "javascript",
  --       "typescript",
  --       "html",
  --     },
  --   },
  -- })
}
