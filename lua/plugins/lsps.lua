local lspconfig = require("lspconfig")
local lspconfig_configs = require("lspconfig.configs")
local lspconfig_util = require("lspconfig.util")

require("lsp-format").setup({})

local root_dir = function()
  return vim.fn.getcwd()
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local servers = {
  "html",
  "cssls",
  --"quick_lint_js",
  "pyright",
  "sumneko_lua",
  "arduino_language_server",
  "bashls",
  "jsonls",
  "yamlls",
  "volar",
  --"vuels",
}

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "html",
    "cssls",
    "pyright",
    "sumneko_lua",
    --"quick_lint_js",
    "arduino_language_server",
    "bashls",
    "yamlls",
    "volar",
    --"vuels",
    "jsonls",
  },
  automatic_installation = true,
})

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

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

-- luasnip setup
local luasnip = require("luasnip")

-- nvim-cmp setup
local cmp = require("cmp")
if cmp ~= nil then
  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<CR>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    }),
    sources = {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "vim-dadbod-completion" },
    },
  })
end

require("lspconfig").texlab.setup({
  root_dir = root_dir,
  build = {
    onSave = true,
    args = { "-pdf", "-output-directory=build", "%f" },
    executable = "latexmk",
    forwardSearchAfter = false,
  },
  chktex = {
    onEdit = false,
    onOpenAndSave = true,
  },
})

require("lspconfig").pyright.setup({
  on_attach = on_attach,
  flags = lsp_flags,
  root_dir = root_dir,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        pythonPath = "/usr/bin/python",
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
      },
    },
  },
})
require("lspconfig").ccls.setup({
  init_options = {
    compilationDatabaseDirectory = "build",
    index = {
      threads = 0,
    },
    filetypes = { "c", "cpp", "hpp", "objc", "objcpp", "ino", "arduino" },
    clang = {
      excludeArgs = { "-frounding-math" },
    },
  },
})

require("lspconfig").sumneko_lua.setup({
  on_attach = on_attach,
  flags = lsp_flags,
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      path = {
        "?.lua",
        "?/init.lua",
        "/home/johnc/.config/init.lua",
        "/usr/share/5.3/?.lua",
        "/usr/share/lua/5.3/?/init.lua",
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

require("lspconfig").bashls.setup({
  filetypes = { "sh", "zsh" },
})
require("lspconfig").html.setup({})
require("lspconfig").cssls.setup({})
require("lspconfig").jsonls.setup({})
--require("lspconfig").quick_lint_js.setup({})
require("lspconfig").yamlls.setup({})
--require"lspconfig".vuels.setup{}

local function on_new_config(new_config, new_root_dir)
  local function get_typescript_server_path(mroot_dir)
    local project_root = lspconfig_util.find_node_modules_ancestor(mroot_dir)
    return project_root
        and (lspconfig_util.path.join(project_root, "node_modules", "typescript", "lib", "tsserverlibrary.js"))
        or ""
  end

  if new_config.init_options
      and new_config.init_options.typescript
      and new_config.init_options.typescript.serverPath == ""
  then
    new_config.init_options.typescript.serverPath = get_typescript_server_path(new_root_dir)
  end
end

local volar_cmd = { "vue-language-server", "--stdio" }
local volar_root_dir = lspconfig_util.root_pattern("package.json")

lspconfig_configs.volar_api = {
  on_attach = on_attach,
  capabilities = capabilities,
  default_config = {
    cmd = volar_cmd,
    root_dir = volar_root_dir,
    on_new_config = on_new_config,
    filetypes = { "vue", "javascript", "typescript" },
    -- If you want to use Volar's Take Over Mode (if you know, you know)
    --filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
    init_options = {
      typescript = {
        serverPath = "",
      },
      languageFeatures = {
        implementation = true, -- new in @volar/vue-language-server v0.33
        references = true,
        definition = true,
        typeDefinition = true,
        callHierarchy = true,
        hover = true,
        rename = true,
        renameFileRefactoring = true,
        signatureHelp = true,
        codeAction = true,
        workspaceSymbol = true,
        completion = {
          defaultTagNameCase = "both",
          defaultAttrNameCase = "kebabCase",
          getDocumentNameCasesRequest = false,
          getDocumentSelectionRequest = false,
        },
      },
    },
  },
}
lspconfig_configs.volar_doc = {
  on_attach = on_attach,
  capabilities = capabilities,
  default_config = {
    cmd = volar_cmd,
    root_dir = volar_root_dir,
    on_new_config = on_new_config,

    filetypes = { "vue", "javascript" },
    -- If you want to use Volar's Take Over Mode (if you know, you know):
    --filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
    init_options = {
      typescript = {
        serverPath = "",
      },
      languageFeatures = {
        implementation = true, -- new in @volar/vue-language-server v0.33
        documentHighlight = true,
        documentLink = true,
        codeLens = { showReferencesNotification = true },
        -- not supported - https://github.com/neovim/neovim/pull/15723
        semanticTokens = false,
        diagnostics = true,
        schemaRequestService = true,
      },
    },
  },
}
lspconfig_configs.volar_html = {
  on_attach = on_attach,
  capabilities = capabilities,
  default_config = {
    cmd = volar_cmd,
    root_dir = volar_root_dir,
    on_new_config = on_new_config,

    filetypes = { "vue", "javascript" },
    -- If you want to use Volar's Take Over Mode (if you know, you know), intentionally no 'json':
    --filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
    init_options = {
      typescript = {
        serverPath = "",
      },
      documentFeatures = {
        selectionRange = true,
        foldingRange = true,
        linkedEditingRange = true,
        documentSymbol = true,
        -- not supported - https://github.com/neovim/neovim/pull/13654
        documentColor = false,
        documentFormatting = {
          defaultPrintWidth = 100,
        },
      },
    },
  },
}

lspconfig_configs.volar = {
  on_attach = on_attach,
  capabilities = capabilities,
  default_config = {
    cmd = volar_cmd,
    root_dir = volar_root_dir,
    on_new_config = on_new_config,

    filetypes = { "vue", "javascript" },
    -- If you want to use Volar's Take Over Mode (if you know, you know):
    --filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
    init_options = {
      typescript = {
        serverPath = "",
      },
      languageFeatures = {
        implementation = true, -- new in @volar/vue-language-server v0.33
        documentHighlight = true,
        documentLink = true,
        codeLens = { showReferencesNotification = true },
        -- not supported - https://github.com/neovim/neovim/pull/15723
        semanticTokens = false,
        diagnostics = true,
        schemaRequestService = true,
      },
    },
  },
}

lspconfig.arduino_language_server.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "arduino-language-server",
    "-cli-config", "/home/johnc/.arduino15/arduino-cli.yaml",
    "-fqbn", "esp32:esp32:esp32",
    "-cli",
    "arduino-cli",
    "-clangd",
    "clangd",
  },
}

lspconfig.volar_api.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
lspconfig.volar_doc.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
--lspconfig.volar.setup{}
lspconfig.volar_html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
