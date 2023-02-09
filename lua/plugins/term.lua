local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

toggleterm.setup({
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = false,
  insert_mappings = true,
  terminal_mappings = false,
  persist_size = true,
  direction = "float",
  close_on_exit = true,
  shell = vim.o.shell,
  winbar={
    enabled=true,
  },
  float_opts = {
    border = "curved",
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
})

function _G.set_terminal_keymaps()
  local term_opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], term_opts)
  vim.api.nvim_buf_set_keymap(0, 't', 'jj', [[<C-\><C-n>]], term_opts)
  vim.api.nvim_buf_set_keymap(0, 't', 'JJ', [[<C-\><C-n>]], term_opts)
  --vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], term_opts)
  --vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], term_opts)
  --vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], term_opts)
  --vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], term_opts)

  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<Cmd>wincmd h<CR>]], term_opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<Cmd>wincmd j<CR>]], term_opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<Cmd>wincmd k<CR>]], term_opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<Cmd>wincmd l<CR>]], term_opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local diag_opts = { noremap=true, silent=false }
vim.keymap.set('n', '<leader>tt', ':ToggleTerm direction=float<CR>', diag_opts)
vim.keymap.set('n', '<leader>th', ':ToggleTerm direction=horizontal size=15<CR>', diag_opts)
vim.keymap.set('n', '<leader>tv', ':ToggleTerm direction=vertical<CR>', diag_opts)
