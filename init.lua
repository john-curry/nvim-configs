require("vim_settings")
require("keymaps")
require("autocommands")
require("plugins")
require("plugins/navic")

--require("catppuccin").setup {
--  flavour = "macchiato"
--}

require("copilot").setup()
require("copilot_cmp").setup()

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

cmp.setup(lsp.defaults.cmp_config({
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end
    },
    sources = {
     { name = "path" },
     { name = "buffer", group_index = 3 },
     { name = "nvim_lsp", group_index = 2 },
     --{ name = "luasnip", group_index = 2 },
     { name = "copilot", group_index = 1 },
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ['<Tab>'] = cmp.mapping(function(fallback)
        local col = vim.fn.col('.') - 1
        if cmp.visible() then
          cmp.select_next_item(select_opts)
        elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
          fallback()
        else
          cmp.complete()
        end
      end, {'i', 's'}),
    }),
  })
)
--local colors = require('catppuccin.groups.integrations.ts_rainbow')

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

require "fidget".setup {}

vim.api.nvim_command "colorscheme xcodedarkhc"
