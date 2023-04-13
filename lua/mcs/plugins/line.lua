local settings = require('mcs.settings')

if settings.nvim_line == "lualine" then
  return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      opts = {},
    },
    config = function()
      require('mcs.plugins.lines.lualine')
    end,
  }
else
  return {
    'vim-airline/vim-airline'
  }
end
