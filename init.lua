require'vim_settings' require'keymaps'
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
require'neoscroll'.setup()
require'inc_rename'.setup{
        input_buffer_type = "dressing",
}

-- Window.nvim
vim.o.winwidth=10
vim.o.winminwidth=10
vim.o.equalalways=false
require'windows'.setup{}

-- Wilder
local wilder = require('wilder')
wilder.setup({modes = {':', '/', '?'}})
wilder.set_option('renderer', wilder.popupmenu_renderer(
        wilder.popupmenu_border_theme({
                highlighter = wilder.basic_highlighter(),
                left = {' ', wilder.popupmenu_devicons()},
                right = {' ', wilder.popupmenu_scrollbar()},
        })
))

-- Null-ls
local builtins = require('null-ls').builtins
require("null-ls").setup({
        sources = {
                builtins.formatting.stylua,
                builtins.diagnostics.eslint,
                builtins.completion.spell,
                builtins.hover.dictionary,
                builtins.formatting.pg_format,
                builtins.formatting.nginx_beautifier,
                builtins.formatting.pg_format,
        },
})
