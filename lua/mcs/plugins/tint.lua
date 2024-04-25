local M = {
  'levouh/tint.nvim',

  config = function()
    require('tint').setup({
      tint = -15,
      saturation = 0.1,
    })
  end
}

return M
