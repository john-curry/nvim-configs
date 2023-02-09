local vim = vim
local o = vim.o
local set = vim.opt
vim.opt.termguicolors = true
vim.g.syntax = "on"
vim.wo.signcolumn = "yes"
o.showtabline = 2
o.number = true
o.hlsearch  = true
o.incsearch = true
o.showcmd = true
o.showmatch = true
o.ignorecase = true
o.winwidth=10
o.winminwidth=10
o.equalalways=false
set.smartindent = true
set.autoindent = true
--set.smarttab = true
set.tabstop=2
set.softtabstop=2
set.shiftwidth=2
set.expandtab=true
set.shell="zsh"
vim.cmd [[set nocp]]
vim.cmd [[filetype plugin on]]
vim.cmd [[ set path+=** ]]
--vim.cmd[[let g:db_ui_winwidth = 30']]
vim.cmd[[let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}]]
vim.cmd[[set nofoldenable    " disable folding]]
vim.cmd[[let g:suda_smart_edit = 1]]
