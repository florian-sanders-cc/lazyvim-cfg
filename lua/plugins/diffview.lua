return {
  {
    "sindrets/diffview.nvim",
    cmd = "Diffview",
    keys = {
      { "<leader>gg", "<cmd>DiffviewOpen<CR>", mode = { "n" }, desc = "Open current status and diff" },
      { "<leader>gf", "<cmd>DiffviewFileHistory<CR>", mode = { "n" }, desc = "Open project history" },
      { "<leader>gq", "<cmd>DiffviewClose<CR>", mode = { "n" }, desc = "Close Diffview" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },
  },
}
