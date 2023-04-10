local settings = require("mcs.settings")
local o = vim.opt

if settings.global_statusline then
  o.laststatus = 3
else
  o.laststatus = 2
end

o.expandtab = true -- use spaces instead of tabs
o.mouse = settings.mouse
o.number = settings.number
o.relativenumber = settings.relative_number
o.shiftwidth = 2 -- the number of spaces inserted for each indentation
o.scrolloff = 9 -- Minimal number of screen lines to keep above and below the cursor
o.splitbelow = true -- force all horizontal splits to go below current window
o.splitright = true -- force all vertical splits to go to the right of current window
o.tabstop = 2 -- how many columns a tab counts force
o.termguicolors = true -- set term gui true colors (most terminals support this)
