require('catppuccin').compile() -- Catppuccin also provide a function to work with the catppuccin compiler.
local latte = require("catppuccin.palettes").get_palette "latte"
local frappe = require("catppuccin.palettes").get_palette "frappe"
local macchiato = require("catppuccin.palettes").get_palette "macchiato"
local ucolors = require "catppuccin.utils.colors"
local mocha = require("catppuccin.palettes").get_palette "mocha"

local clrs = require("catppuccin.palettes").get_palette()
local ctp_feline = require('catppuccin.groups.integrations.feline')


ctp_feline.setup({
    assets = {
        left_separator = "",
        right_separator = "",
        bar = "█",
        mode_icon = "",
        dir = "  ",
        file = "   ",
        lsp = {
            server = "  ",
            error = "  ",
            warning = "  ",
            info = "  ",
            hint = "  ",
        },
        git = {
            branch = "  ",
            added = "  ",
            changed = "  ",
            removed = "  ",
        },
    },
    sett = {
        text = ucolors.vary_color({ latte = latte.base }, clrs.surface0),
        bkg = ucolors.vary_color({ latte = latte.crust }, clrs.surface0),
        diffs = clrs.mauve,
        extras = clrs.overlay1,
        curr_file = clrs.maroon,
        curr_dir = clrs.flamingo,
        show_modified = true -- show if the file has been modified
    },
    mode_colors = {
        ["n"] = { "NORMAL", clrs.lavender },
        ["no"] = { "N-PENDING", clrs.lavender },
        ["i"] = { "INSERT", clrs.green },
        ["ic"] = { "INSERT", clrs.green },
        ["t"] = { "TERMINAL", clrs.green },
        ["v"] = { "VISUAL", clrs.flamingo },
        ["V"] = { "V-LINE", clrs.flamingo },
        ["�"] = { "V-BLOCK", clrs.flamingo },
        ["R"] = { "REPLACE", clrs.maroon },
        ["Rv"] = { "V-REPLACE", clrs.maroon },
        ["s"] = { "SELECT", clrs.maroon },
        ["S"] = { "S-LINE", clrs.maroon },
        ["�"] = { "S-BLOCK", clrs.maroon },
        ["c"] = { "COMMAND", clrs.peach },
        ["cv"] = { "COMMAND", clrs.peach },
        ["ce"] = { "COMMAND", clrs.peach },
        ["r"] = { "PROMPT", clrs.teal },
        ["rm"] = { "MORE", clrs.teal },
        ["r?"] = { "CONFIRM", clrs.mauve },
        ["!"] = { "SHELL", clrs.green },
    }
})
require("feline").setup({
    components = ctp_feline.get(),
})
require("feline").winbar.setup({
})
