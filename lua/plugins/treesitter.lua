local M = {
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate",
  branch = "main",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
  },

  init = function()
    local ensureInstalled = {
      'query', 'go', 'lua', 'javascript', 'typescript', 'vimdoc', 'vim'
    }
    local alreadyInstalled = require('nvim-treesitter.config').get_installed()
    local parsersToInstall = vim.iter(ensureInstalled)
      :filter(function(parser)
        return not vim.tbl_contains(alreadyInstalled, parser)
      end)
      :totable()
    require('nvim-treesitter').install(parsersToInstall)
  end,

  config = function()
    pcall(require('nvim-treesitter.install').update { with_sync = true })
    require('nvim-treesitter').setup({
      -- Add languages to be installed here that you want installef for treesitter
      -- ensure_installed = { 'query', 'go', 'lua', 'javascript', 'typescript', 'vimdoc', 'vim' },
      -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
      auto_install = false,

      highlight = { enable = true },
      indent = { enable = false, disable = { 'python' } },

      incremental_selection = {
        enable = true,
        keymaps = {
          node_incremental = 'v',
          node_decremental = 'V',
        },
      },

      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {},
        },
      },
    })
  end,
}

return M
