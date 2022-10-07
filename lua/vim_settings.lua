local vim = vim
local o = vim.o
local set = vim.opt
vim.opt.termguicolors = true
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
set.tabstop=2
vim.opt.shiftwidth=2
vim.opt.softtabstop=2
set.expandtab=true
set.shell="zsh"
vim.cmd([[set nofoldenable    " disable folding]])
