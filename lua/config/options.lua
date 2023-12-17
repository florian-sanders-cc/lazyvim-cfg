-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.root_spec = { "cwd" }
vim.lsp.set_log_level("debug")
if vim.fn.has("nvim-0.5.1") == 1 then
  require("vim.lsp.log").set_format_func(vim.inspect)
end
