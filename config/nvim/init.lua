-- https://github.com/wbthomason/packer.nvim git clone --depth 1 https://github.com/wbthomason/packer.nvim\ ~/.local/share/nvim/site/pack/packer/start/packer.nvim

-- forknite battle pass
--    /|
--   / | 
--  /  |
--  \  |
--   \ |
--    ||
--    ||
--    ||
--    ||

require('plugins')
require('settings/options')
require('autocmd')

local keymap = vim.keymap.set
local silent_noremap = { silent = true, noremap = true }
local all_remap = function(...) keymap({'n', 'v', 'o'}, ...) end 
local nnoremap_silent = function(...) keymap('n', ..., silent_noremap) end

all_remap('<up>', '<nop>')
all_remap('<up>', '<nop>')
all_remap('<down>', '<nop>')
all_remap('<left>', '<nop>')
all_remap('<right>', '<nop>')
all_remap('<space>', '<nop>', { noremap = true })
vim.g.mapleader = ' '

local noremap_keybinds = { 
    { '<leader>`', '<c-^>' }, 
    { '<leader>`', '<c-^>' },
    { '<esc>', '<esc>:nohlsearch<cr>' },
    { '<leader><leader>', ':gfiles<cr>' },
    { '<leader>.', ':files<cr>' },
    { '<leader>/', ':rg<cr>' },
    { '<leader><', ':buffers<cr>' },
    { '<leader>bb', ':buffers<cr>' },
    { '<leader>gg', ':gedit :<cr>' },
    { '<leader>ot', ':terminal<cr>' },
    { '<leader>fs', ':w<cr>' },
    { '<leader>qq', ':qa<cr>' },
    { '<leader>qq', ':qa!<cr>' },
    { 'zx', ':bd<cr>' }
}


-- for server, opts in pairs(configs) do
--     require('lspconfig')[server].setup(opts)
-- end

-- <leader>wq <c-w>q
-- <leader>wv <c-w>v<c-w>w
-- <leader>ws <c-w>s<c-w>w
-- <leader>wh <c-w>h
-- <leader>wj <c-w>j
-- <leader>wk <c-w>k
-- <leader>wl <c-w>l
-- <leader>wh <c-w>h
-- <leader>wj <c-w>j
-- <leader>wk <c-w>k
-- <leader>wl <c-w>l
-- <leader>wmm <c-w>o
