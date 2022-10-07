local dap = require('dap')

vim.api.nvim_set_keymap("n", "<Leader>db", "<CMD>lua require('dap').toggle_breakpoint()<CR>",
  { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>dc", "<CMD>lua require('dap').continue()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>dd", "<CMD>lua require('dap').continue()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>dh", "<CMD>lua require('dapui').eval()<CR>",
  { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>di", "<CMD>lua require('dap').step_into()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>do", "<CMD>lua require('dap').step_out()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>dO", "<CMD>lua require('dap').step_over()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>dt", "<CMD>lua require('dap').terminate()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>Dt", "<CMD>lua require('dapui').toggle()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>Do", "<CMD>lua require('dapui').open()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>Dc", "<CMD>lua require('dapui').close()<CR>", { noremap = true, silent = true })

dap.adapters.firefox = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/.config/nvim/src/vscode-firefox-debug/dist/adapter.bundle.js'},
}

dap.configurations.vue = {
  {
    name = 'Debug with Firefox',
    type = 'firefox',
    request = 'launch',
    reAttach = true,
    url = 'http://localhost:8080',
    webRoot = '${workspaceFolder}',
--    preLaunchTask = "quasar dev",
    firefoxExecutable = '/opt/firefox/firefox'
  }
}

dap.configurations.typescript = {
  name = 'Debug with Firefox',
  type = 'firefox',
  request = 'launch',
  reAttach = true,
  url = 'http://localhost:8080',
  webRoot = '${workspaceFolder}',
  firefoxExecutable = '/opt/firefox/firefox'
}
