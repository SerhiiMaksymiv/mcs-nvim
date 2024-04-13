local M = {
  'mfussenegger/nvim-dap',

  config = function ()

    local dap = require('dap')

    vim.keymap.set('n', '<leader>dp', dap.toggle_breakpoint, {})
    vim.keymap.set('n', '<leader>dc', dap.continue, {})
  end,
}

return M
