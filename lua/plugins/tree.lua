--require("nvim-tree").setup({
--  sort_by = "case_sensitive",
--  open_on_setup=true,
--  --auto_close=true,
--  open_on_tab=true,
--  view = {
--    --adaptive_size = true,
--    side="left",
--    mappings = {
--      list = {
--        { key = "u", action = "dir_up" },
--      },
--    },
--  },
--  renderer = {
--    group_empty = true,
--  },
--  filters = {
--    dotfiles = true,
--  },
--})
-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
require("neo-tree").setup({
  close_if_last_window = true,
  popup_border_style = "rounded",
  enable_git_status = true,
  enable_diagnostics = true,
  width = 50,
  filesystem = {
    --hijack_netrw_behavior = "open_default",
    hijack_netrw_behavior = "open_current",
    use_libuv_file_watcher = true
  }
})
vim.cmd([[nnoremap \ :Neotree reveal<cr>]])
vim.cmd([[nnoremap <leader>\ :NeoTreeFloatToggle<cr>]])
