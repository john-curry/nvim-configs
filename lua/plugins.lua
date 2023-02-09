vim.cmd([[packadd packer.nvim]])
return require("packer").startup(function(use)
  use "onsails/lspkind.nvim"
  use "onsails/diaglist.nvim"
  use "arzg/vim-colors-xcode"
  use "nanotech/jellybeans.vim"
  use "nvim-lua/popup.nvim"
  use 'lambdalisue/suda.vim'
  use 'windwp/nvim-ts-autotag'
  use 'rafamadriz/friendly-snippets'
  use {'windwp/nvim-autopairs'}
  use "hrsh7th/cmp-cmdline"
  use 'grvcoelho/vim-javascript-snippets'
  use "hrsh7th/cmp-path"
  use {
    "garbas/vim-snipmate",
    requires = {
      'MarcWeber/vim-addon-mw-utils',
      'tomtom/tlib_vim',
      'garbas/vim-snipmate',
      'honza/vim-snippets'
    }
  }
  use { "zbirenbaum/copilot-cmp",
    requires = {
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
      "zbirenbaum/copilot.lua"
    }
  }
  use { "zbirenbaum/copilot.lua" }
  --use {
  --  "zbirenbaum/copilot-cmp",
  --  after = { "copilot.lua" },
  --  config = function ()
  --    require("copilot_cmp").setup()
  --  end
  --}
  use 'danilamihailov/beacon.nvim'
  use 'j-hui/fidget.nvim'
  use {
    'fgheng/winbar.nvim',
    requires = {
      "SmiteshP/nvim-navic",
    }
  }
  --use({
  --  "glepnir/lspsaga.nvim",
  --  branch = "main",
  --  config = function()
  --    local saga = require("lspsaga")

  --    saga.init_lsp_saga({
  --      -- your configuration
  --    })
  --  end,
  --})
  use {
    "nvim-neo-tree/neo-tree.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }
  use {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig"
  }
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }
  use("MunifTanjim/prettier.nvim")
  use("lukas-reineke/lsp-format.nvim")
  use("folke/which-key.nvim")
  use "famiu/nvim-reload"
  use {
    "akinsho/bufferline.nvim",
    config = function()
      require("bufferline").setup { }
    end
  }
  use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
  use("mfussenegger/nvim-dap")
  use("romgrk/fzy-lua-native")
  use({ "dundalek/lazy-lsp.nvim", requires = { "neovim/nvim-lspconfig" } })
  use("chrisbra/csv.vim")
  use("glts/vim-magnum")
  use("glts/vim-radical")
  use("yegappan/mru")
  use("tpope/vim-surround")
  use("tpope/vim-repeat")
  use("tpope/vim-sensible")
  use("tpope/vim-unimpaired")
  use({ "crispgm/nvim-tabline" })
  use("folke/tokyonight.nvim")
  use("tpope/vim-fugitive")
  use("tpope/vim-dotenv")
  use("tpope/vim-dadbod")
  use("kristijanhusak/vim-dadbod-completion")
  use("kristijanhusak/vim-dadbod-ui")
  use("karb94/neoscroll.nvim")
  use("jose-elias-alvarez/null-ls.nvim")
  use('nixprime/cpsm')
  use {
    "gelguy/wilder.nvim",
    requires = {
      'nixprime/cpsm',
      'sharkdp/fd',
      'romgrk/fzy-lua-native'
    }
  }
  use("anuvyklack/middleclass")
  use("anuvyklack/animation.nvim")
  use("mhinz/vim-startify")
  use("rcarriga/nvim-notify")
  use("olivertaylor/vacme")
  use("plan9-for-vimspace/acme-colors")
  use("kristijanhusak/vim-hybrid-material")
  use("tomasr/molokai")
  use("NLKNguyen/papercolor-theme")
  use("lewis6991/hover.nvim")
  use("jacoborus/tender")
  use("tomasiser/vim-code-dark")
  use("raphamorim/lucario")
  use("nvim-lua/plenary.nvim")
  use("drinks5/nvim-yapf-formater")
  use("natecraddock/sessions.nvim")
  use 'p00f/nvim-ts-rainbow'
  use("natecraddock/workspaces.nvim")
  use("sidebar-nvim/sidebar.nvim")
  use("neovim/nvim-lspconfig") -- Configurations for Nvim LSP
  use( "williamboman/mason.nvim" )
  use("williamboman/mason-lspconfig.nvim")
  use("wbthomason/packer.nvim")
  use("nvim-treesitter/nvim-treesitter")
  use('nvim-treesitter/nvim-treesitter-context')
  use("ivanov/vim-ipython")
  use("stevearc/dressing.nvim")
  use("emakman/neovim-latex-previewer")
  use("arzg/vim-plan9")
  use("godlygeek/tabular")
  use("preservim/vim-markdown")
  use {
    "feline-nvim/feline.nvim",
    requires = {
      "SmiteshP/nvim-navic",
    }
  }
  use("sainnhe/everforest")
  use("iamcco/markdown-preview.nvim")
  use("junegunn/goyo.vim")
  use("jaredgorski/spacecamp")
  use("kyazdani42/nvim-web-devicons")
  use("kevinhwang91/rnvimr")
  use("nvim-lua/completion-nvim")
  use { "ray-x/cmp-treesitter", }
  use {
      "hrsh7th/nvim-cmp",
      wants = { "LuaSnip" },
      requires = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lua",
        "ray-x/cmp-treesitter",
        "hrsh7th/cmp-cmdline",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        {
          "L3MON4D3/LuaSnip",
          wants = { "friendly-snippets", "vim-snippets" },
          --config = function()
          --  require("config.snip").setup()
          --end,
        },
        "rafamadriz/friendly-snippets",
        "honza/vim-snippets",
      },
  }
  use"hrsh7th/cmp-nvim-lsp" -- LSP source for nvim-cmp
  use"hrsh7th/cmp-nvim-lsp-signature-help"
  use("saadparwaiz1/cmp_luasnip") -- Snippets source for nvim-cmp
  use("L3MON4D3/LuaSnip")
  use("stevearc/vim-arduino")
  use("akinsho/toggleterm.nvim")
  use("folke/trouble.nvim")
  use("lervag/vimtex")
  use({ "smjonas/inc-rename.nvim" })
  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.0",
    requires = { { "nvim-lua/plenary.nvim" } },
  })
  use({
    "anuvyklack/windows.nvim",
    requires = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim",
    },
    config = function()
      local function cmd(command)
        return table.concat({ "<Cmd>", command, "<CR>" })
      end

      vim.keymap.set("n", "<leader>z", cmd("WindowsMaximize"))
      vim.keymap.set("n", "<leader>_", cmd("WindowsMaximizeVertically"))
      vim.keymap.set("n", "<leader>|", cmd("WindowsMaximizeHorizontally"))
      vim.keymap.set("n", "<leader>=", cmd("WindowsEqualize"))
      vim.o.winwidth = 10
      vim.o.winminwidth = 10
      vim.o.equalalways = false
      require("windows").setup()
    end,
  })
end)
