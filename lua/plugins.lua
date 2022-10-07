vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
        use 'chrisbra/csv.vim'
        use 'glts/vim-magnum'
        use 'glts/vim-radical'
        use 'yegappan/mru'
        use 'tpope/vim-surround'
        use 'tpope/vim-repeat'
        use 'tpope/vim-sensible'
        use 'tpope/vim-unimpaired'
        use{ 'crispgm/nvim-tabline' }
        use "folke/tokyonight.nvim"
        use 'tpope/vim-fugitive'
        use 'tpope/vim-dotenv'
        use 'tpope/vim-dadbod'
        use 'kristijanhusak/vim-dadbod-completion'
        use 'kristijanhusak/vim-dadbod-ui'
        use 'karb94/neoscroll.nvim'
        use 'jose-elias-alvarez/null-ls.nvim'
        use 'gelguy/wilder.nvim'
        use 'anuvyklack/middleclass'
        use 'anuvyklack/animation.nvim'
        use 'mhinz/vim-startify'
        use 'mfussenegger/nvim-dap'
        use 'rcarriga/nvim-notify'
        use 'olivertaylor/vacme'
        use 'plan9-for-vimspace/acme-colors'
        use 'kristijanhusak/vim-hybrid-material'
        use 'tomasr/molokai'
        use 'NLKNguyen/papercolor-theme'
        use "lewis6991/hover.nvim"
        use 'jacoborus/tender'
        use 'tomasiser/vim-code-dark'
        use 'raphamorim/lucario'
        use { "williamboman/mason.nvim" }
        use 'nvim-lua/plenary.nvim'
        use 'drinks5/nvim-yapf-formater'
        use 'natecraddock/sessions.nvim'
        use 'natecraddock/workspaces.nvim'
        use 'sidebar-nvim/sidebar.nvim'
        use 'williamboman/mason-lspconfig.nvim'
        use 'wbthomason/packer.nvim'
        use 'nvim-treesitter/nvim-treesitter'
        use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
        use 'ivanov/vim-ipython'
        use 'SmiteshP/nvim-gps'
        use 'stevearc/dressing.nvim'
        use 'emakman/neovim-latex-previewer'
        use 'arzg/vim-plan9'
        use 'preservim/vim-markdown'
        use 'feline-nvim/feline.nvim'
        use 'sainnhe/everforest'
        use 'iamcco/markdown-preview.nvim'
        use 'junegunn/goyo.vim'
        use 'jaredgorski/spacecamp'
        use 'kyazdani42/nvim-web-devicons'
        use 'kevinhwang91/rnvimr'
        use 'nvim-lua/completion-nvim'
        use 'hrsh7th/nvim-cmp'
        use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
        use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
        use 'L3MON4D3/LuaSnip'
        use 'stevearc/vim-arduino'
        use 'akinsho/toggleterm.nvim'
        use 'folke/trouble.nvim'
        use 'lervag/vimtex'
        use { "smjonas/inc-rename.nvim" }
        use({
                'crispgm/nvim-tabline',
                config = function()
                        require('tabline').setup({})
                end,
        })
        use {
                'nvim-telescope/telescope.nvim', tag = '0.1.0',
                requires = { {'nvim-lua/plenary.nvim'} }
        }
        use {
                'kyazdani42/nvim-tree.lua',
                requires = {
                        'kyazdani42/nvim-web-devicons', -- optional, for file icons
                },
        }
        use { "anuvyklack/windows.nvim",
        requires = {
                "anuvyklack/middleclass",
                "anuvyklack/animation.nvim"
        },
        config = function()
                vim.o.winwidth = 10
                vim.o.winminwidth = 10
                vim.o.equalalways = false
                require('windows').setup()
        end
}
end)
--use 'nanozuki/tabby.nvim'
--use 'shougo/neomru.vim'
--use 'jmcantrell/vim-virtualenv'
--use 'romgrk/barbar.nvim'
