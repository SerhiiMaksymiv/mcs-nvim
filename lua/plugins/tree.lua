return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,

  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  keys = {
    { "<leader>tt", "<cmd>NvimTreeToggle<cr>", desc = "[t]oggle [t]ree" },
  },

  config = function()
    require("nvim-tree").setup({
      update_cwd = true,
      update_focused_file = {
        enable = true,
      },

      view = {
        width = 60,
      },

      filters = {
        dotfiles = false,
        custom = {
          '^.git$'
        }
      },

    })
  end,
}
