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

vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

local job_id = 0
local current_command = ""

vim.keymap.set('t', '<space>rt', "<C-\\><C-n><CR>:quit!<CR>", { silent = true })
vim.keymap.set('t', '<space>rr', "<C-\\><C-n><CR>", { silent = true })

vim.keymap.set("n", "<space>tr", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd('J')
  vim.api.nvim_win_set_height(0, 15)

  job_id = vim.bo.channel
  vim.fn.chansend(job_id, { current_command .. "\r\n" })
end)

vim.keymap.set("n", "<space>te", function()
  if current_command == "" then
    current_command = vim.fn.input("Command: ")
  end

  vim.fn.chansend(job_id, { current_command .. "\r\n" })
end)

vim.api.nvim_create_autocmd({ "FileType" }, {
  callback = function()
    if require("nvim-treesitter.parsers").has_parser() then
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    else
      vim.opt.foldmethod = "syntax"
    end
  end,
})

vim.cmd([[ set nofoldenable]])
vim.cmd 'autocmd CmdlineLeave /,? :set nohlsearch'
