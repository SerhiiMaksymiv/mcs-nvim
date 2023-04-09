local settings = require("mcs.settings")
local o = vim.opt

if settings.global_statusline then
  o.laststatus = 3
else
  o.laststatus = 2
end

o.mouse = settings.mouse
o.number = settings.number
o.relativenumber = settings.relative_number
o.shiftwidth = 2 -- the number of spaces inserted for each indentation
o.scrolloff = 3 -- Minimal number of screen lines to keep above and below the cursor
