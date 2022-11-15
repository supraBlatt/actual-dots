local function config()
  local which_key = require("which-key")

  which_key.setup({
    plugins = {
      marks = true, -- shows a list of your marks on ' and `
      registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      spelling = {
        enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        suggestions = 20, -- how many suggestions should be shown in the list?
      },
      -- the presets plugin, adds help for a bunch of default keybindings in Neovim
      -- No actual key bindings are created
      presets = {
        operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
        motions = true, -- adds help for motions
        text_objects = true, -- help for text objects triggered after entering an operator
        windows = true, -- default bindings on <c-w>
        nav = true, -- misc bindings to work with windows
        z = true, -- bindings for folds, spelling and others prefixed with z
        g = true, -- bindings for prefixed with g
      },
    },

    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    operators = { gc = "Comments" },
    key_labels = {
      -- override the label used to display some keys. It doesn't effect WK in any other way.
      -- For example:
      -- ["<space>"] = "SPC",
      -- ["<cr>"] = "RET",
      -- ["<tab>"] = "TAB",
    },
    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "➜", -- symbol used between a key and it's label
      group = "+", -- symbol prepended to a group
    },
    popup_mappings = {
      scroll_down = "<c-d>", -- binding to scroll down inside the popup
      scroll_up = "<c-u>", -- binding to scroll up inside the popup
    },
    window = {
      border = "none", -- none, single, double, shadow
      position = "bottom", -- bottom, top
      margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
      padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
      winblend = 0,
    },
    layout = {
      height = { min = 4, max = 25 }, -- min and max height of the columns
      width = { min = 20, max = 50 }, -- min and max width of the columns
      spacing = 3, -- spacing between columns
      align = "left", -- align columns left, center or right
    },
    ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
    triggers = "auto", -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
      -- list of mode / prefixes that should never be hooked by WhichKey
      -- this is mostly relevant for key maps that start with a native binding
      -- most people should not need to change this
      -- i = { "j", "k" },
      -- v = { "j", "k" },
    },
  })

end
return { "folke/which-key.nvim", config = config }







-- local wk = require('which-key')
-- wk.setup {
--   plugins = {
--     marks = false,
--     registers = false,
--     spelling = { enabled = false, suggestions = 20 },
--     presets = {
--       operators = false,
--       motions = false,
--       text_objects = false,
--       windows = false,
--       nav = false,
--       z = false,
--       g = false
--     }
--   }
-- }

-- local general = {
--   c = {
--     name = 'Code',
--     d = { '<cmd>TroubleToggle<cr>', 'Toggle Diagnostics' },
--     f = { '<cmd>lua vim.lsp.buf.format()<cr>', 'Format' },
--     l = { '<cmd>set rnu!<cr>', 'Toggle Relative Line Numbers' },
--     r = { '<cmd>lua vim.lsp.buf.rename()<cr>', 'Refactor' }
--   },
--   e = {
--     name = 'Explore',
--     f = { '<cmd>NvimTreeToggle<cr>', 'File Tree' },
--     s = { '<cmd>Alpha<cr>', 'Start' }
--   },
--   f = {
--     name = 'Find with Telescope',
--     f = { '<cmd>Telescope file_browser<cr>', 'By Filename' },
--     g = { '<cmd>Telescope live_grep<cr>', 'By Grep' },
--   },
--   g = {
--     name = 'Go to',
--     d = { '<cmd>lua vim.lsp.buf.definition()<cr>', 'Definition' },
--     D = { '<cmd>lua vim.lsp.buf.declaration()<cr>', 'Declaration' },
--     i = { '<cmd>lua vim.lsp.buf.implementation()<cr>', 'Implementation' },
--     r = { '<cmd>lua vim.lsp.buf.references()<cr>', 'References' },
--     t = { '<cmd>lua vim.lsp.buf.type_defintion()<cr>', 'Type Defintion' },
--     b = { '<cmd>pop<cr>', 'Previous Symbol' },
--   },
--   r = { '<cmd>luafile ~/.config/nvim/init.lua<cr>', 'Refresh Settings' },
--   t = {
--     name = 'Tools',
--     a = { '<cmd>lua vim.lsp.buf.code_action()<cr>', 'Code Actions' },
--     t = { '<cmd>FloatermNew --wintype=split --height=0.3 --position=botright<cr>', 'Terminal' },
--   },
--   z = {
--     name = 'Folds',
--   }
-- }
-- wk.register(general, { prefix = "<leader>" })

-- -- local folding = {
-- --   R = { require('ufo').openAllFolds(), 'Open All Folds' },
-- --   M = { require('ufo').closeAllFolds(), 'Close All Folds' },
-- -- }
-- -- wk.register(folding, { prefix = "z" })
