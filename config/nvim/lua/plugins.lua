local packer = require('packer')
packer.startup(function(use)

  -- themes
  use('wbthomason/packer.nvim')
  use('sainnhe/sonokai')
  use('Mofiqul/dracula.nvim')
  use({ 'folke/tokyonight.nvim', branch = 'main' })

  -- lightline
  -- use({ 'itchyny/lightline.vim', config = "require('config/lightline')" })
  -- use('mengelbrecht/lightline-bufferline')

  -- lualine 
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }

  -- git
  use('itchyny/vim-gitbranch')

  -- telescope
  use({ 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' }, config = "require('config/telescope')" })
  use('nvim-telescope/telescope-ui-select.nvim')
  use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })
  use('nvim-telescope/telescope-file-browser.nvim')

  -- LSP
  use('neovim/nvim-lspconfig')
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use('hrsh7th/nvim-cmp')
  use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})
  use('saadparwaiz1/cmp_luasnip')
 
  -- treesitter
  use({ 'nvim-treesitter/nvim-treesitter', config = "require('config/tree_shitter')", run = ':TSUpdate' })

  -- debugger --- LEARN HOW TO USE
  use('mfussenegger/nvim-dap')
  use('rcarriga/nvim-dap-ui')

  -- QoL
  use('justinmk/vim-sneak')
  use('wellle/targets.vim')
  use('tpope/vim-commentary')
  use('tpope/vim-surround')
  use('gelguy/wilder.nvim')
  use({ "folke/which-key.nvim", config = "require('config/which_key')"})
  -- use 'lukas-reineke/indent-blankline.nvim'

  -- neovim tree
  use('kyazdani42/nvim-web-devicons')
  use('kyazdani42/nvim-tree.lua')
end)
