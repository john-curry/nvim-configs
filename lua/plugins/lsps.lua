local root_dir = function()
        return vim.fn.getcwd()
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

require"mason".setup()
require"mason-lspconfig".setup({
        ensure_installed = {
                --"jedi_language_server",
                "pyright",
                "sumneko_lua",
                "arduino_language_server",
                "quick_lint_js",
                "bashls",
                "jsonls",
                "html",
                "quick_lint_js",
                "cssls",
                "bashls",
        },
        automatic_installation = true,
})

local on_attach = function(_, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
        -- Mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local bufopts = { noremap=true, silent=true, buffer=bufnr }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        --vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        vim.keymap.set("n", "K", require("hover").hover, {desc = "hover.nvim"})
        vim.keymap.set("n", "gK", require("hover").hover_select, {desc = "hover.nvim (select)"})
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)

        vim.keymap.set('n', '<space>wl', function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, bufopts)

        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)

        vim.keymap.set('n', '<space>rn', function()
                return ":IncRename " .. vim.fn.expand("<cword>")
        end, {expr=true, buffer=bufnr, silent=true, noremap=true})

        vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
        vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
        vim.api.nvim_create_autocmd("CursorHold", {
                buffer = bufnr,
                callback = function()
                        local callopts = {
                                focusable = false,
                                close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                                border = 'rounded',
                                source = 'always',
                                prefix = ' ',
                                scope = 'cursor',
                        }
                        vim.diagnostic.open_float(nil, callopts)
                end
        })
end

local lsp_flags = {
        -- This is the default in Nvim 0.7+
        debounce_text_changes = 150,
}

local lspconfig = require('lspconfig')
-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = {
        --'jedi_language_server', 
        "html",
        "cssls",
        "quick_lint_js",
        'pyright',
        'sumneko_lua',
        "arduino_language_server",
        "quick_lint_js" ,
        "bashls",
        "jsonls" 
}

for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
                on_attach = on_attach,
                capabilities = capabilities,
        }
end

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
        snippet = {
                expand = function(args)
                        luasnip.lsp_expand(args.body)
                end,
        },
        mapping = cmp.mapping.preset.insert({
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<CR>'] = cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                },
                ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                                cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                                luasnip.expand_or_jump()
                        else
                                fallback()
                        end
                end, { 'i', 's' }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                                cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                                luasnip.jump(-1)
                        else
                                fallback()
                        end
                end, { 'i', 's' }),
        }),
        sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
        },
}

require"lspconfig".arduino_language_server.setup({
        cmd = {
                "arduino-language-server",
                "-cli-config", "/home/johnc/.arduino15/arduino-cli.yaml",
                "-fqbn", "esp8266:esp8266:huzzah",
                "-cli", "arduino-cli",
                "-clangd", "clangd"
        }
})

require'lspconfig'.texlab.setup{
        root_dir=root_dir,
        build= {
                onSave=true,
                args = { "-pdf", "-output-directory=build", "%f" },
                executable = "latexmk",
                forwardSearchAfter = false,
        },
        chktex = {
                onEdit=false,
                onOpenAndSave=true,
        }

}

require'lspconfig'.pyright.setup{
        on_attach = on_attach,
        flags = lsp_flags,
        root_dir = root_dir,
        settings = {
                python = {
                        analysis = {
                                autoSearchPaths = true,
                                pythonPath = '/usr/bin/python',
                                diagnosticMode = "workspace",
                                useLibraryCodeForTypes = true,
                        }
                }
        }
}
require'lspconfig'.ccls.setup {
        init_options = {
                compilationDatabaseDirectory = "build";
                index = {
                        threads = 0;
                };
                filetypes = { "c", "cpp", "hpp", "objc", "objcpp", "ino", "arduino" };
                clang = {
                        excludeArgs = { "-frounding-math"} ;
                };
        }
}

require'lspconfig'.sumneko_lua.setup {
        on_attach = on_attach,
        flags = lsp_flags,
        settings = {
                Lua = {
                        runtime = {
                                version = 'LuaJIT',
                        },
                        diagnostics = {
                                globals = {'vim'},
                        },
                        workspace = {
                                library = vim.api.nvim_get_runtime_file("", true),
                        },
                        path = {
                                '?.lua',
                                '?/init.lua',
                                '/home/johnc/.config/init.lua',
                                '/usr/share/5.3/?.lua',
                                '/usr/share/lua/5.3/?/init.lua'
                        },
                        telemetry = {
                                enable = false,
                        },
                },
        },
}
