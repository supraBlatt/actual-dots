local new_group = vim.api.nvim_create_augroup
local new_cmd = vim.api.nvim_create_autocmd

--Groups
local packerGrp = new_group('packer', { clear = true })
local lspGrp = new_group('lsp', { clear = true })
--Format file before write
new_cmd(
  { 'BufWritePre' },
  {
    command = 'lua vim.lsp.buf.format()',
    group = lspGrp
  }
)
new_cmd(
  { 'CursorHold' },
  {
    command = 'lua vim.diagnostic.open_float()',
    group = lspGrp
  }
)
--Run :PackerSync whenever plugins.lua is updated
new_cmd(
  { 'BufWritePost' },
  {
    pattern = 'plugins.lua',
    callback = function()
      vim.cmd('luafile %')
      vim.cmd('PackerSync')
    end,
    group = packerGrp
  }
)
-- Hide status/tab/cmd lines in alpha greeter
new_cmd(
  { 'User' },
  {
    pattern = 'AlphaReady',
    desc = 'disable status, tabline, and cmdline',
    callback = function()
      vim.go.laststatus = 0
      vim.opt.showtabline = 0
      vim.opt.cmdheight = 0
    end,
  }
)
-- And to reenable it
new_cmd(
  { 'BufUnload' },
  {
    buffer = 0,
    desc = 'enable what we disabled',
    callback = function()
      vim.go.laststatus = 2
      vim.opt.showtabline = 2
      vim.opt.cmdheight = 1
    end,
  }
)
