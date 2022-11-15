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

local _, _ = pcall(require, "impatient")
_G.do_auto_format = true
_G.symbols = {
  -- File = "",
  -- Module = "",
  Namespace = "",
  Package = "",
  Class = "𝓒",
  Method = "",
  Property = "",
  -- Field = "",
  Constructor = "",
  Enum = "ℰ",
  -- Interface = "ﰮ",
  Function = "λ",
  -- Function = "",
  Variable = "",
  Constant = "",
  String = "𝓐",
  Number = "#",
  Boolean = "⊨",
  Array = "",
  Object = "⦿",
  Key = "🔐",
  Null = "",
  EnumMember = "",
  Struct = "𝓢",
  -- Event = "🗲",
  -- Operator = "+",
  -- TypeParameter = "𝙏",
  -- Class = "",
  Color = "",
  -- Constant = "",
  -- Constructor = "",
  -- Enum = "",
  Event = "",
  Field = "",
  File = "",
  Folder = "",
  -- Function = "",
  Interface = "",
  Keyword = "",
  -- Method = "",
  Module = "",
  Operator = "",
  -- Property = "",
  Reference = "",
  Snippet = "",
  -- Struct = "",
  Text = "",
  TypeParameter = "",
  Unit = "",
  Value = "",
  Copilot = "",
  -- Copilot = "",
  -- Variable = "",
}

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
