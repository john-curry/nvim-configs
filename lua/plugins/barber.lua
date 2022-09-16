local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

--vim.cmd [[
--let fg_target = 'red'
--
--let fg_current  = s:fg(['Normal'], '#efefef')
--let fg_visible  = s:fg(['TabLineSel'], '#efefef')
--let fg_inactive = s:fg(['TabLineFill'], '#888888')
--
--let fg_modified  = s:fg(['WarningMsg'], '#E5AB0E')
--let fg_special  = s:fg(['Special'], '#599eff')
--let fg_subtle  = s:fg(['NonText', 'Comment'], '#555555')
--
--let bg_current  = s:bg(['Normal'], '#000000')
--let bg_visible  = s:bg(['TabLineSel', 'Normal'], '#000000')
--let bg_inactive = s:bg(['TabLineFill', 'StatusLine'], '#000000')
--
--" Meaning of terms:
--"
--" format: "Buffer" + status + part
--"
--" status:
--"     *Current: current buffer
--"     *Visible: visible but not current buffer
--"    *Inactive: invisible but not current buffer
--"
--" part:
--"        *Icon: filetype icon
--"       *Index: buffer index
--"         *Mod: when modified
--"        *Sign: the separator between buffers
--"      *Target: letter in buffer-picking mode
--"
--" BufferTabpages: tabpage indicator
--" BufferTabpageFill: filler after the buffer section
--" BufferOffset: offset section, created with set_offset()
--
--call s:hi_all([
--\ ['BufferCurrent',        fg_current,  bg_current],
--\ ['BufferCurrentIndex',   fg_special,  bg_current],
--\ ['BufferCurrentMod',     fg_modified, bg_current],
--\ ['BufferCurrentSign',    fg_special,  bg_current],
--\ ['BufferCurrentTarget',  fg_target,   bg_current,   'bold'],
--\ ['BufferVisible',        fg_visible,  bg_visible],
--\ ['BufferVisibleIndex',   fg_visible,  bg_visible],
--\ ['BufferVisibleMod',     fg_modified, bg_visible],
--\ ['BufferVisibleSign',    fg_visible,  bg_visible],
--\ ['BufferVisibleTarget',  fg_target,   bg_visible,   'bold'],
--\ ['BufferInactive',       fg_inactive, bg_inactive],
--\ ['BufferInactiveIndex',  fg_subtle,   bg_inactive],
--\ ['BufferInactiveMod',    fg_modified, bg_inactive],
--\ ['BufferInactiveSign',   fg_subtle,   bg_inactive],
--\ ['BufferInactiveTarget', fg_target,   bg_inactive,  'bold'],
--\ ['BufferTabpages',       fg_special,  bg_inactive, 'bold'],
--\ ['BufferTabpageFill',    fg_inactive, bg_inactive],
--\ ])
--
--call s:hi_link([
--\ ['BufferCurrentIcon',  'BufferCurrent'],
--\ ['BufferVisibleIcon',  'BufferVisible'],
--\ ['BufferInactiveIcon', 'BufferInactive'],
--\ ['BufferOffset',       'BufferTabpageFill'],
--\ ])
--]]
