local M = {
  'mfussenegger/nvim-dap',

  keys = {
    { "<leader>ds", "<cmd>lua require'dap'.disconnect()<CR><cmd>lua require'dap'.close()<CR>", desc = "[d]ap [c]lose" },
  },

  config = function ()

    local dap = require('dap')

    vim.keymap.set('n', '<leader>dp', dap.toggle_breakpoint, {})
    vim.keymap.set('n', '<leader>dc', dap.continue, {})
  end,
}

return M
