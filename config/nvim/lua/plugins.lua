local packer = require('packer')

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

packer.startup(function(use)
  use('wbthomason/packer.nvim')
--  use({ 'folke/tokyonight.nvim', branch = 'main' })

  -- git
  -- use('itchyny/vim-gitbranch')

  use(require("plug-conf/alpha"))
  use(require("plug-conf/bufferline")) -- shows buffers as tabs. can remove?
  use(require("plug-conf/comment"))
--  use(require("plug-conf/cmp"))
  use(require("plug-conf/dap"))
  use(require("plug-conf/lualine"))
  use(require("plug-conf/misc"))
  use(require("plug-conf/nvim-tree"))

  use(require("plug-conf/sonokai"))
  use(require("plug-conf/symbols-outline"))
  use(require("plug-conf/telescope"))
  use(require("plug-conf/toggleterm"))
  use(require("plug-conf/which-key"))

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
end)
