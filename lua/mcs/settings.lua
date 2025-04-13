local M = {}

-- theme: nightfox, tokyonight, catppuccin(cat), material(mat), jb
-- refer to the themes settings file for different styles
M.theme = "tokyonight"

-- nvim status line plugins
-- available: lualine, airline
M.nvim_line = "lualine"

-- Toggle global status line
M.global_statusline = true

-- use rg instead of grep
-- M.grepprg = "rg --hidden --vimgrep --smart-case --"

-- set numbered lines
M.number = true

-- set relative numbered lines
M.relative_number = true

-- enable mouse see :h mouse
M.mouse = "nv"

-- Tools that should be installed by Mason
M.tools = {}

-- LSPs that should be installed by Mason-lspconfig
M.lsp_servers = {
  "lua_ls",
  "ts_ls",
  "gopls",
}

-- one of "all", "maintained" (parsers with maintainers), or a list of languages
M.treesitter_ensure_installed = {
  "go",
  "lua",
}

return M
