require'vim_settings'
require'keymaps'
require'autocommands'
require'plugins'

vim.cmd('colorscheme hybrid_material')
vim.cmd("set signcolumn=no")
vim.cmd("setglobal signcolumn=no")

require'configs'
require'telescope'.load_extension('notify')
require'nvim-gps'.setup()
require'dressing'.setup()
require'sessions'.setup()
require'inc_rename'.setup{
  input_buffer_type = "dressing",
}

--vim.cmd[[ autocmd FileType * :windo set signcolumn=no ]]
--vim.cmd("windo set signcolumn=no")
