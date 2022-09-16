vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
  use 'rcarriga/nvim-notify'
  use 'romgrk/barbar.nvim'
  use 'olivertaylor/vacme'
  use 'plan9-for-vimspace/acme-colors'
  use 'kristijanhusak/vim-hybrid-material'
  use 'tomasr/molokai'
  use 'NLKNguyen/papercolor-theme'
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
  use 'godlygeek/tabular'
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
end)
  --use 'nvim-lualine/lualine.nvim'
  --use { 'fgheng/winbar.nvim' }
  --use 'michaeljsmith/vim-indent-object'
  --use 'drinksober/nvim-yapf-formatter'
  --use {
  --  'amirali/yapf.nvim',
  --  requires = { 'nvim-lua/plenary.nvim' }, 
  --  config = function()
  --    require('yapf').setup{}
  --  end,
  --}
  --use 'nmac427/guess-indent.nvim'
