require("vim_settings")
require("keymaps")
require("autocommands")
require("plugins")
require 'nvim-web-devicons'.setup {}
require("plugins/navic")
require("dressing").setup()
require("configs")
require("sessions").setup()
require("neoscroll").setup()
require("dapui").setup({})
require("aerial").setup()
require("mason").setup()
require("mason-lspconfig").setup()
require("lsp-format").setup()
require('mini.statusline').setup()
require('mini.tabline').setup()
require('mini.cursorword').setup()
require('mini.pairs').setup()
require('mini.splitjoin').setup()

require("scope").setup({})
require('neogit').setup({
  integrations = {
    diffview = true,  -- integrate with vim-diffview
    telescope = true, -- integrate with telescope.nvim
  }

})
require("diffview").setup()
require('Comment').setup()
require('mini.colors').setup()

local lsp = require('lsp-zero').preset({})
lsp.extend_cmp()

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
  require("lsp-format").on_attach(client)
end)

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local root_dir = function()
  return vim.fn.getcwd()
end

lsp.configure('tailwindcss', {
  root_dir = root_dir,
  settings = {
    tailwindCSS = {
      classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
      lint = {
        cssConflict = "warning",
        invalidApply = "error",
        invalidConfigPath = "error",
        invalidScreen = "error",
        invalidTailwindDirective = "ignore",
        invalidVariant = "error",
        recommendedVariantOrder = "warning",
        unknownAtRules = "ignore",
      },
      validate = true
    }
  }
})
lsp.configure('cssls', {
  --root_dir = root_dir,
  capabilities = capabilities,
  filetypes = { "css", "scss", "less", "sass" },
  on_attach = function(client, bufnr)
    --lsp.default_keymaps({ buffer = bufnr })
    --require("lsp-format").on_attach(client)
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        -- disable virtual text
        virtual_text = false,

        -- show signs
        signs = true,

        -- delay update diagnostics
        update_in_insert = false,
      }
    )
  end,
  settings = {
    css = {
      validate = true,
      unknownAtRules = 'ignore'
    },
    scss = {
      validate = true,
      unknownAtRules = 'ignore'
    },
    less = {
      validate = true,
      unknownAtRules = 'ignore'
    },
  }
})
local util = require 'lspconfig.util'
local function get_typescript_server_path(root_dir)
  local global_ts = '/usr/local/lib/node_modules/vls/node_modules/typescript/lib'
  -- Alternative location if installed as root:
  -- local global_ts = '/usr/local/lib/node_modules/typescript/lib'
  local found_ts = ''
  local function check_dir(path)
    found_ts = util.path.join(path, 'node_modules', 'typescript', 'lib')
    if util.path.exists(found_ts) then
      return path
    end
  end
  if util.search_ancestors(root_dir, check_dir) then
    return found_ts
  else
    return global_ts
  end
end

require('lspconfig').volar.setup({
  on_new_config = function(new_config, new_root_dir)
    new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
  end,
  --root_dir = root_dir,
  on_attach = function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
    require("lsp-format").on_attach(client)
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        -- disable virtual text
        virtual_text = true,

        -- show signs
        signs = true,

        -- delay update diagnostics
        update_in_insert = false,
      }
    )
    lsp.default_keymaps({ buffer = bufnr })
  end,
  settings = {
    lint = {
      unknownAtRules = "ignore",
    },
  }
})

local arduino = require 'arduino'
require 'lspconfig'['arduino_language_server'].setup {
  on_new_config = arduino.on_new_config,
}

lsp.configure('lua_ls', {
  cmd = { "lua-language-server" },
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

--lsp.configure('clangd', {
--  --root_dir = root_dir,
--  settings = {
--    cmd = {
--      'clangd',
--      "--query-driver='/home/johnc/.espressif/tools/xtensa-esp32-elf/esp-2021r2-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc'",
--    },
--    filetypes = { 'c', 'cpp' }
--  },
--})

lsp.configure('pyright', {
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
lsp.skip_server_setup({ 'clangd' })
lsp.setup()
require("clangd_extensions").setup({
  server = {
    cmd = {
      'clangd',
      '--compile-commands-dir=' .. vim.fn.getcwd() .. '/build',
      "--query-driver='/home/johnc/.espressif/tools/xtensa-esp32-elf/esp-2021r2-patch5-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-g++'",
    },
  }
})
local cmp = require('cmp')

require("copilot").setup({
  suggestion = { enabled = false },
  panel = { enabled = false },
})

require("copilot_cmp").setup({
  method = "getCompletionsCycling",
})

local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end

local lspkind = require("lspkind")
vim.opt.completeopt = { 'menuone', 'noselect', 'noinsert', 'preview' }
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })

cmp.setup(lsp.defaults.cmp_config({
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol_txt",
      max_width = 100,
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
    { name = "copilot",  group_index = 2 },
    { name = "nvim_lsp", group_index = 2 },
    { name = "path",     group_index = 2 },
    { name = "buffer",   group_index = 2 },
  },

  sorting = {
    priority_weight = 2,
    comparators = {
      require("copilot_cmp.comparators").prioritize,

      -- Below is the default comparitor list and order for nvim-cmp
      cmp.config.compare.offset,
      -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.recently_used,
      cmp.config.compare.locality,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },

  mapping = cmp.mapping.preset.insert({
    ['<C-s>'] = cmp.mapping.complete({ reason = cmp.ContextReason.Auto }),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ["<Tab>"] = vim.schedule_wrap(function(fallback)
      if cmp.visible() and has_words_before() then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
      else
        fallback()
      end
    end),
  }),
})
)

local wk = require('which-key')
--
--local lsp_flags = {
--  -- This is the default in Nvim 0.7+
--  debounce_text_changes = 150,
--}
--
--lsp.configure('pyright', {
--  on_attach = on_attach,
--  flags = lsp_flags,
--  root_dir = root_dir,
--  settings = {
--    python = {
--      analysis = {
--        autoSearchPaths = true,
--        pythonPath = "/usr/bin/python3.8",
--        diagnosticMode = "workspace",
--        useLibraryCodeForTypes = false,
--      },
--    },
--  },
--})
--
--lsp.setup()
--
--local cmp = require("cmp")
--
require("nvim-treesitter.configs").setup {
  playground            = {
    enable = true,
    disable = {},
    updatetime = 25,         -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },
  autotag               = {
    enable = true,
  },
  indent                = {
    enable = false,
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
  rainbow               = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    --color = colors,
    --termcolors = colors -- table of colour name strings
    -- colors = {}, -- table of hex strings
  },
  highlight             = {
    ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    enable = true,
    additional_vim_regex_highlighting = false,
    disable = { "vue", "javascript" }
  },
  context_commentstring = {
    enable = true,
  },
}

--vim.treesitter.language.register('typescript', 'javascript')
--local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
--parser_config.arduino = {
--  install_info = {
--
--    url = "~/src/tree-sitter-arduino",      -- local path or git repo
--    files = { "src/parser.c" },             -- note that some parsers also require src/scanner.c or src/scanner.cc
--    -- optional entries:
--    branch = "main",                        -- default branch in case of git repo if different from master
--    generate_requires_npm = true,           -- if stand-alone parser without npm dependencies
--    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
--  },
--  filetype = "ino",                         -- if filetype does not match the parser name
--}
--parser_config.cpp = {
--  install_info = {
--
--    url = "~/src/tree-sitter-cpp",          -- local path or git repo
--    files = { "src/parser.c" },             -- note that some parsers also require src/scanner.c or src/scanner.cc
--    -- optional entries:
--    branch = "main",                        -- default branch in case of git repo if different from master
--    generate_requires_npm = true,           -- if stand-alone parser without npm dependencies
--    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
--  },
--  filetype = { "ino", "cpp", "hpp" },       -- if filetype does not match the parser name
--}
--parser_config.c = {
--  install_info = {
--
--    url = "~/src/tree-sitter-c",            -- local path or git repo
--    files = { "src/parser.c" },             -- note that some parsers also require src/scanner.c or src/scanner.cc
--    -- optional entries:
--    branch = "main",                        -- default branch in case of git repo if different from master
--    generate_requires_npm = true,           -- if stand-alone parser without npm dependencies
--    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
--  },
--  filetype = { "c", "h" },                  -- if filetype does not match the parser name
--}
-- bind printhl to <c-e> in normal mode
vim.keymap.set('n', '<C-e>', ":TSHighlightCapturesUnderCursor<CR>", { silent = false })
vim.cmd [[colo xcodedarkhc2]]
