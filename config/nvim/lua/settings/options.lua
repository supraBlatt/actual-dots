local opt = vim.opt 
local cmd = vim.api.nvim_command

-- hi
local set_options = function(locality,options)
  for key, value in pairs(options) do
    locality[key] = value
  end
end


cmd("colorscheme sonokai")
-- Set Statements
-- set relativenumber
local options_global = {
  number = true,
  expandtab = true,
  hidden = true,
  smartcase = true,
  showmode = false,
  termguicolors = true,
  foldenable = false,
  wrap = false,
  shiftwidth = 2,
  tabstop = 2,
  softtabstop = 2,
  updatetime = 100,
  tw = 80,
  autoread = true,
  scrolloff = 1,
  incsearch = true,
  backspace = 'indent,eol,start',
  background = 'dark',
  inccommand = 'nosplit',
  clipboard = 'unnamedplus',
  virtualedit = 'block',
  foldmethod = 'indent',
}

set_options(opt,options_global)
