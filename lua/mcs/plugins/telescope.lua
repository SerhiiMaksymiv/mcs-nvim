local M = {
  "nvim-telescope/telescope.nvim",

  cmd = "Telescope",

  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },

  keys = {
    { "<leader>fc", "<cmd>Telescope commands<cr>", desc = "[f]ind [c]ommands" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "[f]ind [f]iles" },
    { "<leader>fs", "<cmd>Telescope grep_string<cr>", desc = "[f]ind [s]tring" },
  },

  config = function()
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
	layout_strategy = "vertical",
	layout_config = {
          width = 0.95,
          height = 0.85,
        }, -- layout config
      }, -- defualts
    }) -- telescope setup end
  end,
}

return M
