local M = {
  "tpope/vim-fugitive",

  keys = {
    { "<leader>G", "<cmd>Git<cr>", desc = "[G]it" },
    { "<leader>B", "<cmd>Git blame<cr>", desc = "Git [B]lame" },
  },
}

return M
