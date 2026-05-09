local api = vim.api

-- Highlight on yank
api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- show cursor line only in active window
local cursorGrp = api.nvim_create_augroup("CursorLine", { clear = true })
api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  pattern = "*",
  command = "set cursorline",
  group = cursorGrp,
})

api.nvim_create_autocmd(
  { "InsertEnter", "WinLeave" },
  { pattern = "*", command = "set nocursorline", group = cursorGrp }
)

-- --------------------------------------------------------------------
-- Auto Save on Focus Lost or Buffer Leave
-- --------------------------------------------------------------------
-- Automatically saves changes when you leave a buffer or Neovim loses focus.
-- Only triggers for normal file buffers (not terminals or help).
vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave", "BufWinLeave", "InsertLeave" }, {
  callback = function()
    if vim.bo.filetype ~= "" and vim.bo.buftype == "" and vim.bo.modified then
      vim.cmd("silent! w")
    end
  end,
  desc = "Auto-save modified buffers on focus or mode change",
})

-- --------------------------------------------------------------------
-- Open NvimTree on startup
-- --------------------------------------------------------------------
-- vim.api.nvim_create_autocmd("VimEnter", {
-- 	callback = function()
--     vim.cmd('NvimTreeOpen')
--     vim.cmd('wincmd l')
-- 	end,
-- })

vim.cmd 'autocmd CmdlineLeave /,? :set nohlsearch'
