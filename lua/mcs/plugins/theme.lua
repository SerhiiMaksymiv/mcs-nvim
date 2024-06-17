local settings = require("mcs.settings")
if settings.theme == "tokyonight" then
  return {
    "folke/tokyonight.nvim",
    branch = "main",
    config = function()
      require("mcs.plugins.themes.tokyonight")
    end,
  }
elseif settings.theme == "nightfox" then
  return {
    "EdenEast/nightfox.nvim",
    config = function()
      require("mcs.plugins.themes.nightfox")
    end,
  }
elseif settings.theme == "cat" then
  return {
    "catppuccin/nvim", as = "catppuccin",
    config = function()
      require("mcs.plugins.themes.catppuccin")
    end,
  }
else
  return {
    'marko-cerovac/material.nvim',
    config = function()
      require("mcs.plugins.themes.material")
      require('material.functions').change_style("palenight")
    end,
  }
end

