local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
return require('lazy').setup({
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    },
    lazy = false,
  },
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    },
    lazy = false,
  },
  { "sekke276/dark_flat.nvim" },
  'christianchiarulli/nvcode-color-schemes.vim',
  'nvim-treesitter/playground',
  'sainnhe/sonokai',
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim",        -- optionalj
    },
    config = true,
  },
  "sindrets/diffview.nvim",
  'MunifTanjim/eslint.nvim',
  {
    'edKotinsky/Arduino.nvim',
    lazy = false,
    opts = {
      default_fqbn = "esp32:esp32:esp32da",

      --Path to clangd (all paths must be full)
      clangd = '/usr/bin/clangd',

      --Path to arduino-cli
      arduino = '/home/johnc/.local/bin/arduino-cli',

      --Data directory of arduino-cli
      arduino_config_dir = '/home/johnc/.arduino15',

      --Extra options to arduino-language-server
      --extra_opts = { ... }
    }
  },
  "smartpde/telescope-recent-files",
  'knubie/vim-kitty-navigator',
  "markonm/traces.vim",
  "p00f/clangd_extensions.nvim",
  { "tiagovla/scope.nvim" },
  { 'kvrohit/rasmus.nvim',         lazy = false, priority = 1000 },
  { 'dasupradyumna/midnight.nvim', lazy = false, priority = 1000 },
  "nyoom-engineering/oxocarbon.nvim",
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000 -- Ensure it loads first
  },
  { 'mg979/vim-visual-multi', branch = 'master' },
  { 'echasnovski/mini.nvim',  version = false },
  'stevearc/aerial.nvim',
  'vim-scripts/synic.vim',
  'tomasr/molokai',
  "fladson/vim-kitty",
  'edluffy/hologram.nvim',
  ({ 'akinsho/flutter-tools.nvim', dependencies = 'nvim-lua/plenary.nvim' }),
  "onsails/lspkind.nvim",
  "onsails/diaglist.nvim",
  {
    "arzg/vim-colors-xcode",
    lazy = false,
    priority = 1000,
    config = function()
      -- load the colorscheme here
      --vim.cmd([[colorscheme xcodedarkhc]])
    end,
  },
  "nanotech/jellybeans.vim",
  "nvim-lua/popup.nvim",
  'lambdalisue/suda.vim',
  'windwp/nvim-ts-autotag',
  'rafamadriz/friendly-snippets',
  'windwp/nvim-autopairs',
  "hrsh7th/cmp-cmdline",
  'grvcoelho/vim-javascript-snippets',
  "hrsh7th/cmp-path",
  {
    'salkin-mada/openscad.nvim',
    --config = function ()
    --    require('openscad')
    --    -- load snippets, note requires
    --    vim.g.openscad_load_snippets = true
    --end,
    dependencies = { 'L3MON4D3/LuaSnip' }
  },
  {
    "garbas/vim-snipmate",
    dependencies = {
      'MarcWeber/vim-addon-mw-utils',
      'tomtom/tlib_vim',
      'garbas/vim-snipmate',
      'honza/vim-snippets'
    }
  },
  {
    "zbirenbaum/copilot-cmp",
    dependencies = {
      { dir = "~/.config/nvim/src/nvim-cmp" },
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
      "zbirenbaum/copilot.lua"
    }
  },
  { "zbirenbaum/copilot.lua" },
  'danilamihailov/beacon.nvim',
  {
    'fgheng/winbar.nvim',
    dependencies = {
      "SmiteshP/nvim-navic",
    }
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  },
  {
    "SmiteshP/nvim-navic",
    dependencies = "neovim/nvim-lspconfig"
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      { 'neovim/nvim-lspconfig' },
      {
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, "MasonUpdate")
        end,
      },

      { 'williamboman/mason-lspconfig.nvim' },
      { dir = "~/.config/nvim/src/nvim-cmp" },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  },
  "MunifTanjim/prettier.nvim",
  "lukas-reineke/lsp-format.nvim",
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  "famiu/nvim-reload",
  {
    "akinsho/bufferline.nvim",
    config = function()
      require("bufferline").setup {}
    end
  },
  { "rcarriga/nvim-dap-ui",  dependencies = { "mfussenegger/nvim-dap" } },
  "mfussenegger/nvim-dap",
  "romgrk/fzy-lua-native",
  { "dundalek/lazy-lsp.nvim", dependencies = { "neovim/nvim-lspconfig" } },
  "chrisbra/csv.vim",
  "glts/vim-magnum",
  "glts/vim-radical",
  "yegappan/mru",
  --"tpope/vim-surround",
  --"tpope/vim-repeat",
  --"tpope/vim-sensible",
  --"tpope/vim-unimpaired",
  { "crispgm/nvim-tabline" },
  "folke/tokyonight.nvim",
  --"tpope/vim-fugitive",
  --"tpope/vim-dotenv",
  --"tpope/vim-dadbod",
  "kristijanhusak/vim-dadbod-completion",
  "kristijanhusak/vim-dadbod-ui",
  "karb94/neoscroll.nvim",
  "jose-elias-alvarez/null-ls.nvim",
  {
    "gelguy/wilder.nvim",
    dependencies = {
      'nixprime/cpsm',
      'sharkdp/fd',
      'romgrk/fzy-lua-native'
    }
  },
  'nixprime/cpsm',
  "anuvyklack/middleclass",
  "anuvyklack/animation.nvim",
  "mhinz/vim-startify",
  "rcarriga/nvim-notify",
  "olivertaylor/vacme",
  "plan9-for-vimspace/acme-colors",
  "kristijanhusak/vim-hybrid-material",
  "tomasr/molokai",
  "NLKNguyen/papercolor-theme",
  "lewis6991/hover.nvim",
  "jacoborus/tender",
  "tomasiser/vim-code-dark",
  "raphamorim/lucario",
  "nvim-lua/plenary.nvim",
  "drinks5/nvim-yapf-formater",
  "natecraddock/sessions.nvim",
  'p00f/nvim-ts-rainbow',
  "natecraddock/workspaces.nvim",
  "sidebar-nvim/sidebar.nvim",
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "nvim-treesitter/nvim-treesitter",
  'nvim-treesitter/nvim-treesitter-context',
  --"ivanov/vim-ipython",
  "stevearc/dressing.nvim",
  --"emakman/neovim-latex-previewer",
  "arzg/vim-plan9",
  "godlygeek/tabular",
  "preservim/vim-markdown",
  {
    "feline-nvim/feline.nvim",
    dependencies = {
      "SmiteshP/nvim-navic",
    }
  },
  "sainnhe/everforest",
  --"iamcco/markdown-preview.nvim",
  --"junegunn/goyo.vim",
  --"jaredgorski/spacecamp",
  "kyazdani42/nvim-web-devicons",
  "kevinhwang91/rnvimr",
  "nvim-lua/completion-nvim",
  "ray-x/cmp-treesitter",
  {
    dir = "~/.config/nvim/src/nvim-cmp",
    wants = { "LuaSnip" },
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "ray-x/cmp-treesitter",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "friendly-snippets",
      "vim-snippets",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
      "honza/vim-snippets",
    },
  },
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lsp-signature-help",
  "saadparwaiz1/cmp_luasnip",
  "L3MON4D3/LuaSnip",
  --"stevearc/vim-arduino",
  {
    "akinsho/toggleterm.nvim",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
    }
  },
  "folke/trouble.nvim",
  --"lervag/vimtex",
  "smjonas/inc-rename.nvim",
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build =
    'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.1',
    dependencies = { { "nvim-lua/plenary.nvim" } },
  },
  --{
  --  "anuvyklack/windows.nvim",
  --  dependencies = {
  --    "anuvyklack/middleclass",
  --    "anuvyklack/animation.nvim",
  --  },
  --  config = function()
  --    local function cmd(command)
  --      return table.concat({ "<Cmd>", command, "<CR>" })
  --    end

  --    vim.keymap.set("n", "<leader>z", cmd("WindowsMaximize"))
  --    vim.keymap.set("n", "<leader>_", cmd("WindowsMaximizeVertically"))
  --    vim.keymap.set("n", "<leader>|", cmd("WindowsMaximizeHorizontally"))
  --    vim.keymap.set("n", "<leader>=", cmd("WindowsEqualize"))
  --    vim.o.winwidth = 10
  --    vim.o.winminwidth = 10
  --    vim.o.equalalways = false
  --    require("windows").setup()
  --  end,
  --}
})
