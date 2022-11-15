local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git", "clone", "--depth", "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

local packer = require('packer')
-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Plugins go here
packer.startup(function(use)
  use('wbthomason/packer.nvim')
  -- use({ 'folke/tokyonight.nvim', branch = 'main' }) 
 
  -- use('itchyny/vim-gitbranch')
  use(require("plug-conf/alpha"))
  use(require("plug-conf/bufferline")) -- shows buffers as tabs. can remove?
  use(require("plug-conf/comment"))
  use(require("plug-conf/dap"))
  use(require("plug-conf/lualine"))
  use(require("plug-conf/misc"))
  use(require("plug-conf/nvim-tree"))

  use(require("plug-conf/sonokai"))
  use(require("plug-conf/symbols-outline"))
  use(require("plug-conf/telescope"))
  use(require("plug-conf/toggleterm"))
  use(require("plug-conf/tree-shitter"))
  use(require("plug-conf/which-key"))


  use(require("plug-conf/cmp"))
  use(require("lsp-conf"))
  -- LSP
  -- use('neovim/nvim-lspconfig')
  -- use('hrsh7th/cmp-nvim-lsp')
  -- use('hrsh7th/cmp-buffer')
  -- use('hrsh7th/cmp-path')
  -- use('hrsh7th/nvim-cmp')
  -- use('saadparwaiz1/cmp_luasnip')

  -- -- QoL
  -- use('justinmk/vim-sneak')
  -- use('wellle/targets.vim')
  -- use('tpope/vim-commentary')
  -- use('gelguy/wilder.nvim')
  -- use('kyazdani42/nvim-web-devicons')

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
