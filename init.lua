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

require("nvim-autopairs").setup {}
require("mason").setup()
require("mason-lspconfig").setup()
require("aerial").setup()
local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.configure('arduino_language_server', {
  cmd = {
    "arduino-language-server",
    "-cli-config", "/home/johnc/.arduino15/arduino-cli.yaml",
    --"-fqbn", "esp32:esp32:adafruit_feather_esp32s3",
    --"-fqbn", "esp32:esp32:firebeetle32",
    "--fqbn", "esp32:esp32:esp32da",
    "--library", "include",
    "-cli", "arduino-cli",
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
local root_dir = function()
  return vim.fn.getcwd()
end

local on_attach = function(client, bufnr)
  require("lsp-format").on_attach(client)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  --vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })
  vim.keymap.set("n", "gK", require("hover").hover_select, { desc = "hover.nvim (select)" })
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "<space>k", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)

  vim.keymap.set("n", "<space>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)

  vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)

  vim.keymap.set("n", "<space>rn", function()
    return ":IncRename " .. vim.fn.expand("<cword>")
  end, { expr = true, buffer = bufnr, silent = true, noremap = true })

  vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<space>f", vim.lsp.buf.formatting, bufopts)
  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      local callopts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = "rounded",
        source = "always",
        prefix = " ",
        scope = "cursor",
      }
      vim.diagnostic.open_float(nil, callopts)
    end,
  })
end
local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
lsp.configure('pyright', {
  on_attach = on_attach,
  flags = lsp_flags,
  root_dir = root_dir,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        pythonPath = "/usr/bin/python3.8",
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = false,
      },
    },
  },
})

--lsp.configure('clangd', {
--})

--lsp.on_attach(function(client, bufnr)
--  if client.server_capabilities.documentSymbolProvider then
--    require('nvim-navic').attach(client, bufnr)
--  end
--end)

require("luasnip.loaders.from_snipmate").lazy_load()

lsp.setup()

local cmp = require("cmp")
local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
end

local lspkind = require("lspkind")
vim.opt.completeopt = {'menuone', 'noselect', 'noinsert', 'preview'}
vim.opt.shortmess = vim.opt.shortmess + { c = true}
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
    { name = "path", group_index = 3},
    { name = "buffer", group_index = 3 },
    { name = "nvim_lsp", group_index = 2 },
    --{ name = "luasnip", group_index = 2 },
    { name = "copilot", group_index = 1 },
  },

  mapping = cmp.mapping.preset.insert({
    ['<C-s>'] = cmp.mapping.complete({ reason = cmp.ContextReason.Auto }),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    }),
    ["<Tab>"] = vim.schedule_wrap(function(fallback)
      if cmp.visible() and has_words_before() then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
      else
        fallback()
      end
    end, {'i', 's'}),
  }),
})
)

require("nvim-treesitter.configs").setup {
  autotag = {
    enable = true,
  },
 --ensure_installed = { "c", "lua", "python", "arduino", "bash", "cmake", "css", "html", "json", "scss", "typescript"},--, "vue", "latex"},
  indent  = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn", -- set to `false` to disable one of the mappings
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
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
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.arduino = {
  install_info = {

    url = "~/src/tree-sitter-arduino", -- local path or git repo
    files = {"src/parser.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
    -- optional entries:
    branch = "main", -- default branch in case of git repo if different from master
    generate_requires_npm = true, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
  },
  filetype = "ino", -- if filetype does not match the parser name
}
parser_config.cpp = {
  install_info = {

    url = "~/src/tree-sitter-cpp", -- local path or git repo
    files = {"src/parser.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
    -- optional entries:
    branch = "main", -- default branch in case of git repo if different from master
    generate_requires_npm = true, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
  }
  --filetype = "ino", -- if filetype does not match the parser name
}

require("diaglist").init({
    -- optional settings
    -- below are defaults
    debug = false,

    -- increase for noisy servers
    debounce_ms = 150,
})

require "fidget".setup {}

vim.api.nvim_command "set background=dark"
vim.api.nvim_command "colorscheme molokai"
require("flutter-tools").setup{} -- use defaults
