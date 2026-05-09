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

api.nvim_create_autocmd(
  { "BufLeave", "FocusLost" },
  {
    pattern = "*",
    callback = function()
      if vim.bo.modified and not vim.bo.readonly and vim.fn.expand("%") ~= "" and vim.bo.buftype == "" then
        vim.api.nvim_command('silent update')
      end
    end,
  }
)

-- local function pipeToClipboard()
--   local output=''
--   local delim=''
--   for i,v in ipairs(vim.v.event.regcontents) do
--     output = output .. delim .. v
--     delim = '\n'
--   end
--   if (vim.v.event.regname == '+' or vim.v.event.regname == '*') then
--
--     copyCmd = io.popen('rclip -loose', 'w')
--     copyCmd:write(output)
--     copyCmd:flush()
--     copyCmd:close()
--   end
-- end
--
-- vim.api.nvim_create_autocmd("TextYankPost", {
--   callback = function()
--     pipeToClipboard()
--   end,
-- })

vim.cmd 'autocmd CmdlineLeave /,? :set nohlsearch'
