return {
  "stevearc/oil.nvim",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    {
      mode = "n",
      "<leader>o",
      "<cmd>Oil<CR>",
      desc = "Open the Oil file viewer",
    },
  },
  opts = {
    default_file_explorer = true,
  },
}
