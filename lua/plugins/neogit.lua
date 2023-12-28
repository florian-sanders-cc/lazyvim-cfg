return {
  "NeogitOrg/neogit",
  config = true,
  cmd = "Neogit",
  keys = { { "<leader>gg", "<cmd>Neogit<CR>", mode = { "n" }, desc = "Open Neogit" } },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "sindrets/diffview.nvim",
    "ibhagwan/fzf-lua",
  },
  init = function()
    require("neogit").setup({
      integrations = {
        telescope = true,
      },
    })
  end,
}
