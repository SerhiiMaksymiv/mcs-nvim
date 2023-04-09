local M = {
  'nvim-lualine/lualine.nvim',
  opts = {
    options = {
      icons_enabled = false,
      theme = 'onedark',
      component_separators = '|',
      section_separators = '',
      sections = {
	lualine_c = { {'filename', path = 1, file_status = false, full_path = true, shorten = false } }
      },
    },
  },
}

return M
