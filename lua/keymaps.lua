vim.cmd [[
inoremap jj <esc>
inoremap JJ <esc>
let mapleader = "-"
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

nnoremap <Leader>to :Neotree toggle<CR>
nnoremap <Leader>tc :Neotree close<CR>
nnoremap <Leader>ts :Neotree open<CR>

nnoremap <Leader>s :source $MYVIMRC<CR>
nnoremap <Leader>ew :e $MYVIMRC<CR>
nnoremap <Leader>et :tabnew $MYVIMRC<CR>
nnoremap <Leader>ev :vs $MYVIMRC<CR>
nnoremap <Leader>p :e ~/.config/nvim/lua/plugins.lua<CR>
nnoremap <Leader>f :Prettier<CR>
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F(vi(<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap il{ :<c-u>normal! F{vi{<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>ss :SessionsSave .session<cr>
nnoremap <leader>ls :SessionsLoad .session<cr>

noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>

noremap <leader>y :YapfFormat<CR>
vnoremap <leader>y :YapfFormat 'full'<CR>

nnoremap + :res +5<CR>
nnoremap _ :res -5<CR>
]]
