local option = vim.opt
local global = vim.g

global.mapleader = ' '
option.relativenumber = true
option.cursorline = true
option.number = true
option.expandtab = true
option.autoindent = true
option.clipboard:append('unnamedplus')
option.softtabstop = 4
option.wrap = false
option.autoread = true
option.undofile = false
option.swapfile = false
option.relativenumber = true
option.tabstop = 4
option.shiftwidth = 4
option.splitright = true
option.smartindent = true
option.ignorecase = true
option.smartcase = true
option.clipboard:append("unnamedplus")
option.scrolloff = 8
option.termguicolors = true
option.equalalways = true
option.cmdheight = 0
vim.opt.laststatus = 2
vim.opt.statusline = " %f%m %=%l/%L %p%% [%{&filetype}] "

vim.cmd([[set nofoldenable]])

