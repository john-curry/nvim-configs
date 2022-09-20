require("hover").setup {
        init = function()
                -- Require providers
                require("hover.providers.lsp")
                -- require('hover.providers.gh')
                -- require('hover.providers.jira')
                --require('hover.providers.man')
                --require('hover.providers.dictionary')
        end,
        preview_opts = {
                border = nil
        },
        preview_window = false,
        title = true
}

-- Setup keymaps
-- vim.keymap.set("n", "K", require("hover").hover, {desc = "hover.nvim"})
-- vim.keymap.set("n", "gK", require("hover").hover_select, {desc = "hover.nvim (select)"})
