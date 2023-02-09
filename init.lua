 
require("vim_settings")
require("keymaps")
require("autocommands")
require("plugins")
require("plugins/navic")
require("copilot").setup({
  suggestion = { enabled = false },
  panel = { enabled = false },
})
require("copilot_cmp").setup({
  method = "getCompletionsCycling",
})

require("dressing").setup()
require("configs")
require("telescope").load_extension("notify")
require("sessions").setup()
require("neoscroll").setup()

require("windows").setup({})
require("dapui").setup({})

--require("nvim-autopairs").setup {}
require("mason").setup()
require("mason-lspconfig").setup()
local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.configure('arduino_language_server', {
  cmd = {
    "arduino-language-server",
    "-cli-config", "/home/johnc/.arduino15/arduino-cli.yaml",
    "-fqbn", "esp32:esp32:esp32",
    "-cli",
    "arduino-cli",
    "-clangd",
    "clangd",
  },
})
lsp.configure('sumneko_lua', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})

lsp.on_attach(function(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    require('nvim-navic').attach(client, bufnr)
  end
end)

require("luasnip.loaders.from_snipmate").lazy_load()

lsp.setup()
local cmp = require("cmp")
local select_opts = {behavior = cmp.SelectBehavior.Select}

local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
end

vim.opt.completeopt = {'menuone', 'noselect', 'noinsert', 'preview'}
-- shortmess is used to avoid excessive messages
vim.opt.shortmess = vim.opt.shortmess + { c = true}
local lspkind = require("lspkind")
vim.api.nvim_set_hl(0, "CmpItemKindCopilot", {fg ="#6CC644"})
cmp.setup(lsp.defaults.cmp_config({
    window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
    },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol_txt",
      max_width = 70,
      ellipsis_char = '...',
      symbol_map = { Copilot = "" },
      menu = ({
      buffer = "[Buffer]",
      nvim_lsp = "[LSP]",
      luasnip = "[LuaSnip]",
      path = "[Path]",
      copilot = "[Copilot]",
      nvim_lua = "[Lua]",
      latex_symbols = "[Latex]",
    })
    })
  },

  sources = {
    { name = "path", group_index = 2},
    { name = "buffer", group_index = 2 },
    { name = "nvim_lsp", group_index = 2 },
    --{ name = "luasnip", group_index = 2 },
    { name = "copilot", group_index = 2 },
  },

  mapping = cmp.mapping.preset.insert({
    ['<C-s>'] = cmp.mapping.complete({ reason = cmp.ContextReason.Auto }),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({
      -- this is the important line
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    }),
    ["<Tab>"] = vim.schedule_wrap(function(fallback)
      local col = vim.fn.col(".") - 1
      if cmp.visible() and has_words_before() then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
      elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        cmp.complete()
      else
        fallback()
      end
    end),
    --['<Tab>'] = cmp.mapping(function(fallback)
    --  if cmp.visible() then
    --    cmp.select_next_item(select_opts)
    --  elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    --    fallback()
    --  else
    --    cmp.complete()
    --  end
    --end, {'i', 's'}),
  }),
})
)

require("nvim-treesitter.configs").setup {
  autotag = {
    enable = true,
  },
  indent  = {
    enable = true
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    --color = colors,
    --termcolors = colors -- table of colour name strings
    -- colors = {}, -- table of hex strings
  }
}

require("diaglist").init({
    -- optional settings
    -- below are defaults
    debug = false,

    -- increase for noisy servers
    debounce_ms = 150,
})

require "fidget".setup {}

vim.api.nvim_command "colorscheme xcodedarkhc"
