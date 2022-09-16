require("nvim-tree").setup({
  sort_by = "case_sensitive",
  open_on_setup=true,
  --auto_close=true,
  open_on_tab=true,
  view = {
    adaptive_size = true,
    side="right",
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
