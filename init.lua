require("vim_settings")
require("keymaps")
require("autocommands")
require("plugins")

vim.cmd("colorscheme hybrid_material")
vim.cmd("set signcolumn=no")
vim.cmd("setglobal signcolumn=no")

require("configs")

require("telescope").load_extension("notify")
require("nvim-gps").setup()
require("dressing").setup()
require("sessions").setup()
require("neoscroll").setup()
require("inc_rename").setup({
	input_buffer_type = "dressing",
})

require("tabline").setup({
	show_index = true, -- show tab index
	show_modify = true, -- show buffer modification indicator
	modify_indicator = "[+]", -- modify indicator
	no_name = "[No name]", -- no name buffer name
})

-- Window.nvim
require("windows").setup({})
require("dapui").setup({})
require("which-key").setup({
	plugins = {
		spelling = {
			enabled = true,
		},
	},
})
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require("null-ls").setup({
	debug = true,
	sources = {
		require("null-ls").builtins.formatting.prettier,
		require("null-ls").builtins.formatting.stylua,
		require("null-ls").builtins.diagnostics.eslint,
		require("null-ls").builtins.completion.spell,
	},
	-- you can reuse a shared lspconfig on_attach callback here
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					--vim.lsp.buf.formatting_sync()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})

local prettier = require("prettier")
local u = require("prettier.utils")

prettier.setup({
	["null-ls"] = {
		condition = function()
			return u.config_exists({
				-- if `true`, checks `package.json` for `"prettier"` key
				check_package_json = false,
			})
		end,
		runtime_condition = function(_)
			-- return false to skip running prettier
			return true
		end,
		timeout = 5000,
	},
	bin = "prettier", -- or `'prettierd'` (v0.22+)
	filetypes = {
		"css",
		"graphql",
		"html",
		"javascript",
		"javascriptreact",
		"json",
		"less",
		"markdown",
		"scss",
		"typescript",
		"typescriptreact",
		"yaml",
		"vue",
		"typescript",
	},
})
