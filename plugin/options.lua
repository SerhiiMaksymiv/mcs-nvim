local o = vim.opt
o.laststatus = 3
o.expandtab = true -- use spaces instead of tabs
o.mouse = "nv"
o.number = true
o.relativenumber = true
o.shiftwidth = 2 -- the number of spaces inserted for each indentation
o.scrolloff = 9 -- Minimal number of screen lines to keep above and below the cursor
o.splitbelow = true -- force all horizontal splits to go below current window
o.splitright = true -- force all vertical splits to go to the right of current window
o.tabstop = 2 -- how many columns a tab counts force
o.termguicolors = true -- set term gui true colors (most terminals support this)
o.clipboard = "unnamedplus" -- Share clipboard between vim and system

o.fillchars = { fold = " " }
o.foldmethod = "indent"
o.smartindent = false
o.foldenable = false
o.foldlevel = 99
vim.g.markdown_folding = 1
