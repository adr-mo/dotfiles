local option = vim.opt
local global = vim.g

global.mapleader = ' '

option.relativenumber = true
option.number = true
option.tabstop = 4
option.shiftwidth = 4
option.expandtab = true
option.autoindent = true
option.clipboard:append('unnamedplus')
option.iskeyword:append("-")
option.softtabstop = 4
option.splitright = true
option.smartindent = true
option.ignorecase = true
option.smartcase = true
option.scrolloff = 8
option.wrap = false
option.termguicolors = true
option.equalalways = true
option.cmdheight = 0
option.laststatus = 0
option.statusline = "%=%f%="
option.autoread = true

vim.cmd([[set nofoldenable]])

-- equalize windows on resize
vim.api.nvim_create_autocmd("VimResized", {
  callback = function()
    vim.cmd("wincmd =")
  end,
})
