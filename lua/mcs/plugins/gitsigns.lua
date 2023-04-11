local M = {
  'lewis6991/gitsigns.nvim',

  config = function()
    require('gitsigns').setup {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    }
  end
}

return M
