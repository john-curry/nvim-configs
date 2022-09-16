## Vanilla Vim
### Basic Commands
- Repeat last action -> `.`
- Increment/Decrement -> `<C-a>` `<C-x>`
- Start recording -> `<letter>q`
- Repeat recordng -> `@<letter>`
### Visual Selection
- Target last visual selection is search and replace -> `%V`

### Config
-- Open Config In Window -> `-ew`
-- Open Config In New Tab -> `-et`
-- Open Config In Vertical Split -> `-ev`

-- Open Plugins -> `-p`

## Plugins
### Barbar
- Buffer Previous' -> `<A-,>'`
- Buffer Next' -> `<A-.>'`
- Buffer MovePrevious -> `<A-<>'`
- Buffer MoveNext -> `<A->>'`
- Buffer Goto 1 -> `<A-1>'`
- Buffer Goto 2 -> `<A-2>'`
- Buffer Goto 3 -> `<A-3>'`
- Buffer Goto 4 -> `<A-4>'`
- Buffer Goto 5 -> `<A-5>'`
- Buffer Goto 6 -> `<A-6>'`
- Buffer Goto 7 -> `<A-7>'`
- Buffer Goto 8 -> `<A-8>'`
- Buffer Goto 9 -> `<A-9>'`
- Buffer Last -> `<A-0>'`
- Buffer Pin -> `<A-p>'`
- Buffer Close -> `<A-c>'`
- Buffer Pick -> `<C-p>'`
- Buffer OrderByBufferNumber -> `<Space>bb'`
- Buffer OrderByDirectory -> `<Space>bd'`
- Buffer OrderByLanguage -> `<Space>bl'`
- Buffer OrderByWindowNumber -> `<Space>bw'`
### NVim Tree
- Open Tree -> `-to` 
### Toggle Term
- Enter Normal Mode -> `JJ`
- Movement -> `<C-h>` `<C-j>` `<C-k>` `<C-l>`
### CMP 
- Scroll Doc Up/Down -> `<C-d>` `<C-f>`
- Complete -> `<C-Space>`
- Confirm Replace -> `<CR>` Enter
- Select Next Item -> `<Tab>` Tab
- Select Previous Item -> `<S-Tab>` Shift-Tab
### Telescope
- action_keys = { -- key mappings for actions in the trouble list
- close = `q`, -- close the list
- cancel = `<esc>`, -- cancel the preview and get back
- refresh = `r`, -- manually refresh
- jump = {`<cr>`, `<tab>`}, -- jump to the diagnostic or open / close folds
- open_split = { `<c-x>` }, -- open buffer in new split
- open_vsplit = { `<c-v>` }, -- open buffer in new vsplit
- open_tab = { `<c-t>` }, -- open buffer in new tab
- jump_close = {`o`}, -- jump to the diagnostic and close the list
- toggle_mode = `m`, -- toggle `workspace` and `document` in diagnostic 
- toggle_preview = `P`, -- toggle auto_preview
- hover = `K`, -- opens a small popup with the full multiline message
- preview = `p`, -- preview the diagnostic location
- close_folds = {`zM`, `zm`}, -- close all folds
- open_folds = {`zR`, `zr`}, -- open all folds
- toggle_fold = {`zA`, `za`}, -- toggle fold of current file
- previous = `k`, -- preview item
- next = `j` -- next item
### Diagnostics
- Open Diagnostic Float -> `<space>e`
- Goto Previous Error -> `[d`
- Goto Next Error -> `]d`
- Set Location List -> `<space>q`
### LSP
- Declaration -> `gD`
- Definition -> `gd`
- Hover Definition -> `K`
- Implementation -> `gi`
- Signature Help -> `<C-k>`
- Add Workspace Folder -> `<space>wa`
- Remove Workspace Folder -> `<space>wr`
- Incremental Rename -> `<space>rn`
- List Workspaces -> `<space>wl`
- Type Definition -> `<space>D`
- code_action -> `<space>ca`
- references -> `gr`
- formatting -> `<space>f`
