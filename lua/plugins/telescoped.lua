-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                   -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true,    -- override the file sorter
      case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    }
  }
}
require("telescope").load_extension("notify")
require('telescope').load_extension('fzf')
require('telescope').load_extension('recent_files')
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fs', builtin.git_status, {})
vim.keymap.set('n', '<leader>ft', builtin.treesitter, {})
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>fd', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>fw', builtin.lsp_workspace_symbols, {})
vim.keymap.set('n', '<leader>fy', builtin.lsp_dynamic_workspace_symbols, {})
vim.keymap.set('n', '<leader>fi', builtin.lsp_implementations, {})
vim.keymap.set('n', '<leader>fe', builtin.lsp_definitions, {})
vim.keymap.set('n', '<leader>fp', builtin.lsp_type_definitions, {})

vim.api.nvim_set_keymap("n", "<Leader>fo",
  [[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]], {})
--{ noremap = true, silent = true })
--vim.keymap.set('n', '<leader>fo', require('telescope').extensions.recent_files.pick(), {})
--vim.keymap.set('n', '<leader>fr', vim.("Telescope oldfiles<cr>"), {})

local wk = require("which-key")

wk.register({
  f = {
    name = "Find",
    f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Find File" },
    g = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Live Grep" },
    b = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "Buffers" },
    h = { "<cmd>lua require('telescope.builtin').help_tags()<cr>", "Help Tags" },
    t = { "<cmd>lua require('telescope.builtin').treesitter()<cr>", "Treesitter!" },
  }
}, { prefix = "<leader>" })
