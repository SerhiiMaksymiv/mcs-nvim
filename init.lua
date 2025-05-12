-- Load global functions
-- require("mcs.globals")

-- Plugin management via lazy
require("mcs.lazy")

-- Plugin management via Packer
-- require("mcs.packer")
-- "Global" Keymappings
require("mcs.mappings")

-- All non plugin related (vim) options
require("mcs.options")

-- Vim autocommands/autogroups
require("mcs.autocmd")


-- Colorscheme for Telescope window
local colors = {
  text = "#f8f8ff",
  surface0 = "#222221",
  mantle = "#222221",
  flamingo = "#9cffd3",
  pink = "#aca39a",
  green = "#a1e1a1",
  surface1 = "#5c5c5b",
}

local TelescopeColor = {
	TelescopeMatching = { fg = colors.flamingo },
	TelescopeSelection = { fg = colors.text, bg = colors.surface1, bold = true },

	TelescopePromptPrefix = { bg = colors.surface0 },
	TelescopePromptNormal = { bg = colors.surface0 },
	TelescopeResultsNormal = { bg = colors.mantle },
	TelescopePreviewNormal = { bg = colors.mantle },
	TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
	TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
	TelescopePreviewBorder = { bg = colors.mantle, fg = colors.mantle },
	TelescopePromptTitle = { bg = colors.pink, fg = colors.mantle },
	TelescopeResultsTitle = { fg = colors.mantle },
	TelescopePreviewTitle = { bg = colors.green, fg = colors.mantle },
}

for hl, col in pairs(TelescopeColor) do
	vim.api.nvim_set_hl(0, hl, col)
end
