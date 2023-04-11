local M = {
  'lukas-reineke/indent-blankline.nvim',

  config = function()
    vim.opt.termguicolors = true
    vim.cmd [[highlight IndentBlanklineIndent1 guifg=#402232 gui=nocombine]]

    require('indent_blankline').setup {
      char_highlight_list = {
        "IndentBlanklineIndent1",
      },
      show_trainiling_blankline_indent = false,
    }
  end
}

return M
