local M = {
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },

  config = function()
    pcall(require('nvim-treesitter.install').update { with_sync = true })
    require('nvim-treesitter.configs').setup {
      -- Add languages to be installed here that you want installef for treesitter
      ensure_installed = { 'query', 'go', 'lua', 'javascript', 'typescript', 'vimdoc', 'vim' },
      -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
      auto_install = false,

      highlight = { enable = true },
      indent = { enable = true, disable = { 'python' } },

      incremental_selection = {
        enable = true,
        keymaps = {
          -- init_selection = '<leader>ss',
          node_incremental = 'v',
          node_decremental = 'V',
          -- scope_incremental = '<leaded>sc',
        },
      },

      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {},
        },

        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = '@class.outer',
          },
          goto_next_end = {
            [']M'] = '@function.outer',
            [']['] = '@class.outer',
          },
          goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
          },
          goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
          },
        },

        swap = {
          enable = true,
          swap_next = {
            ['<leader>a'] = '@parameter.inner',
          },
          swap_previous = {
            ['<leader>A'] = '@parameter.inner',
          },
        },
      },
    }
  end,
}

return M
