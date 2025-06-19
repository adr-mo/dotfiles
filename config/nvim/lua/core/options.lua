local option = vim.opt
local global = vim.g

global.mapleader = ' '
option.relativenumber = true
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
option.laststatus = 0 -- Or 3 for global statusline

vim.cmd([[set nofoldenable]])

-- equalize windows on resize
vim.api.nvim_create_autocmd("VimResized", {
    callback = function()
        vim.cmd("wincmd =")
    end,
})
-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "ColorColumn",
      timeout = 200,
    })
  end,
})
