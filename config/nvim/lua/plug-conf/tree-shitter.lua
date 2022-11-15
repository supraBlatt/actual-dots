require('nvim-treesitter.configs').setup({
  ensure_installed = { 'cpp', 'json', 'javascript', 'lua', 'markdown', 'haskell', 'python' },
  sync_install = true,
  highlight = { enable = true, additional_vim_regex_highlighting = false, }, 
  matchparen = { enable = true },
  indent = { enable = true },
})
