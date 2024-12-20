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
    { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "[f]ind [k]eymaps" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "[f]ind [f]iles" },
    { "<leader>fs", "<cmd>Telescope grep_string<cr>", desc = "[f]ind [s]tring" },
    { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "[g]it [s]tatus" },
    { "<leader>lg", "<cmd>Telescope live_grep<cr>", desc = "[l]ive [g]rep" },
    { "<leader>sb", "<cmd>Telescope buffers<cr>", desc = "[s]how [b]uffers" },
    -- file_browser extension remaps
    { "<leader>fb", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", desc = "[f]ile [b]rowser", { noremap = true } },
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

      pickers = {
        find_files = {
          mappings = {
            i = {
              ["<C-h>"] = "select_horizontal", -- opens found file in horizontal window(?), :sp file. works as <C-ss>
            },
          },
          find_command = { "rg", "--files", "--hidden", "--no-ignore-vcs", "--glob", "!**/.git/*" },
        },
      },

      extensions = {
        fzf = {}
      },

    }) -- telescope setup end

    telescope.load_extension 'fzf'
    telescope.load_extension 'file_browser'
  end,
}

return M
