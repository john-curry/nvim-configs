local vim = vim
local o = vim.o
local set = vim.opt
vim.g.syntax = "on"
vim.wo.signcolumn = "yes"
vim.o.showtabline = 2
o.number = true
o.hlsearch  = true
o.incsearch = true
o.showcmd = true
o.showmatch = true
o.ignorecase = true
set.smartindent = true
set.autoindent = true
set.termguicolors = true
set.tabstop=2
--set.shiftwidth=2
set.expandtab=true
set.shell="zsh"
