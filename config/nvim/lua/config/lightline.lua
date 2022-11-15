local cmd = vim.api.nvim_command

cmd([[ 
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
]])
