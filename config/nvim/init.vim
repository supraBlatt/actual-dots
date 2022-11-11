" Plugins
call plug#begin('~/.local/share/nvim/plugged')

" themes
Plug 'dracula/vim'
Plug 'sainnhe/sonokai'

" lightline
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

" git 
Plug 'itchyny/vim-gitbranch'

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-file-browser.nvim'

" LSP 
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'

" treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" debugger --- LEARN HOW TO USE  
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'

" QUALITY SHIT
Plug 'justinmk/vim-sneak'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'gelguy/wilder.nvim', { 'do': ':UpdateRemotePlugins' }

" TODO harpoon
" TODO wilder 
" TODO luasnip


" forknite battle pass
   " /|
  " / | 
 " /  |
 " \  |
  " \ |
   " ||
   " ||
   " ||
   " ||

" neovim tree 
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

call plug#end()

" Set Statements
set relativenumber
set number
set expandtab
set hidden
set smartcase
set noshowmode
"set mouse=a
set shiftwidth=4
set tabstop=2
set softtabstop=2
"set completeopt-=preview
set updatetime=100
set background=dark
set termguicolors
set tw=80
set autoread
set backspace=indent,eol,start
set scrolloff=1
set incsearch
set clipboard^=unnamed,unnamedplus
set virtualedit=block
set foldmethod=indent
set nofoldenable
set nowrap

map <UP> <NOP>
map <DOWN> <NOP>
map <LEFT> <NOP>
map <RIGHT> <NOP>

" Stolen from ARC (gay?)
noremap <Space> <Nop>
let mapleader="\<Space>"

" nnoremap <silent> y y$
nnoremap <silent> <leader>` <c-^>
nnoremap <silent> <esc> <esc>:nohlsearch<cr>
nnoremap <silent> <leader><leader> :gfiles<cr>
nnoremap <silent> <leader>. :files<cr>
nnoremap <silent> <leader>/ :rg<cr>
nnoremap <silent> <leader>< :buffers<cr>
nnoremap <silent> <leader>bb :buffers<cr>
nnoremap <silent> <leader>gg :gedit :<cr>
nnoremap <silent> <leader>ot :terminal<cr>
nnoremap <silent> <leader>fs :w<cr>
nnoremap <silent> <leader>qq :qa<cr>
nnoremap <silent> <leader>qq :qa!<cr>
nnoremap <silent> zx :bd<cr>

nnoremap <silent> <leader>wq <c-w>q
nnoremap <silent> <leader>wv <c-w>v<c-w>w
nnoremap <silent> <leader>ws <c-w>s<c-w>w
nnoremap <silent> <leader>wh <c-w>h
nnoremap <silent> <leader>wj <c-w>j
nnoremap <silent> <leader>wk <c-w>k
nnoremap <silent> <leader>wl <c-w>l
nnoremap <silent> <leader>wh <c-w>h
nnoremap <silent> <leader>wj <c-w>j
nnoremap <silent> <leader>wk <c-w>k
nnoremap <silent> <leader>wl <c-w>l
nnoremap <silent> <leader>wmm <c-w>o

" find files using telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files hidden=true<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fe <cmd>Telescope file_browser hidden=true<cr>

" nvim-tree
nnoremap <c-n> :nvimtreetoggle<cr>
nnoremap <leader>r :nvimtreerefresh<cr>
nnoremap <leader>n :nvimtreefindfile<cr>



" lightline
let g:lightline = {
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'filename', 'gitbranch', 'readonly', 'modified' ] ]
    \ },
    \ 'tabline': {
    \   'left': [ ['buffers'] ],
    \   'right': [ ['close'] ]
    \ },
    \ 'component_expand': {
    \   'buffers': 'lightline#bufferline#buffers'
    \ },
    \ 'component_type': {
    \   'buffers': 'tabsel'
    \ },
    \ 'component_function': {
    \   'gitbranch': 'branch'
    \ },
    \ 'colorscheme': 'sonokai',
    \ }
function! Branch()
    return gitbranch#name() != '' ? ' ' . gitbranch#name() : ''
endfunction

" wilder
call wilder#setup({'modes': [':', '/', '?']})


call wilder#set_option('pipeline', [
      \   wilder#branch(
      \     wilder#cmdline_pipeline({
      \       'fuzzy': 1,
      \       'set_pcre2_pattern': 1,
      \     }),
      \     wilder#python_search_pipeline({
      \       'pattern': 'fuzzy',
      \     }),
      \   ),
      \ ])

" TELESCOPE THINGS
lua << EOF
require('telescope').setup{
    defaults = {
        prompt_prefix = "❯ "
    }

}
require('telescope').load_extension('fzf')
require("telescope").load_extension "file_browser"
EOF

" LSP - stolen from Teej and GC, thanks 
lua << EOF
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

    local default = {
        -- keybinds 
        on_attach = function()
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0})
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})
        vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, {buffer=0})
        vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, {buffer=0})
        vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", {buffer=0})
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {buffer=0})
        vim.keymap.set("n", "<leader>fr", vim.lsp.buf.formatting, {buffer=0})
        end,
        autostart = true, capabilities = capabilities
    }

    local configs = {
        clangd = default,
        pyright = default,
        gopls = default,
        bashls = default
    }

    for server, opts in pairs(configs) do
        require('lspconfig')[server].setup(opts)
    end
EOF


" nvim-cmp stuff 
set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      -- ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ['CR'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true, }),
      ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<C-p>'] = cmp.mapping.select_prev_item({ behavior =cmp.SelectBehavior.Insert }),
      ['<Down>'] =cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
      ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'luasnip' }, -- For luasnip users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })
EOF

" TREE SHITTER 
lua << EOF
  require('nvim-treesitter.configs').setup {
    -- Modules and its options go here
    highlight = { enable = true },
    incremental_selection = { enable = true },
    textobjects = { enable = true },
  }
EOF
" Colorscheme

let g:sonokai_style = 'andromeda'
let g:sonokai_better_performance = 1

colorscheme sonokai
