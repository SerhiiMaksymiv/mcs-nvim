local settings = require("mcs.settings")

if settings.theme == "tokyonight" then
  return {
    "folke/tokyonight.nvim",
    branch = "main",
    config = function()
      require("mcs.plugins.themes.tokyonight")
    end,
  }
end

