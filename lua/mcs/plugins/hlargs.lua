local M = {
  "m-demare/hlargs.nvim",
  dependencies = {
   'nvim-treesitter/nvim-treesitter'
  },

  config = function()
    --  do something, as of now not sure what exactly, 
    --  but will leave it here to figure out
    local hlargs = require('hlargs')

    hlargs.setup {
      color = "#ef9062",
      paint_arg_declarations = true,
      paint_arg_usages = true,
      use_colorpalette = true,
      colorpalette = {
        { fg = "#ef9062" },
        { fg = "#3AC6BE" },
        { fg = "#35D27F" },
        { fg = "#EB75D6" },
        { fg = "#E5D180" },
        { fg = "#8997F5" },
        { fg = "#D49DA5" },
        { fg = "#7FEC35" },
        { fg = "#F6B223" },
        { fg = "#F67C1B" },
        { fg = "#DE9A4E" },
        { fg = "#BBEA87" },
        { fg = "#EEF06D" },
        { fg = "#8FB272" },
      },
      excluded_filetypes = {}
    }

    hlargs.enable()
  end
}

return M
