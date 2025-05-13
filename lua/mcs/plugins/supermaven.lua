local M = {
  "supermaven-inc/supermaven-nvim",
  config = function()
    require("supermaven-nvim").setup({
      keymaps = {
        accept_suggestion = "<C-j>",
        accept_word = "<C-k",
      },
    })
  end,
}

return M
