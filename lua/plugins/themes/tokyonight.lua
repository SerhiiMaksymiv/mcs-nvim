require("tokyonight").setup({
  -- night, storm, day, moon
  style = "night",
  transparent = true,
})

vim.cmd("colorscheme tokyonight")
vim.api.nvim_set_hl(0, "MiniJump", { fg = "#FFFFFF", bg = "#ff00a0" })

