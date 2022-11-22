local function config_project()
  require("project_nvim").setup({

    -- detection_methods = { "lsp", "pattern" }, -- NOTE: lsp detection will get annoying with multiple langs in one project
    detection_methods = { "pattern" },

    -- patterns used to detect root dir, when **"pattern"** is in detection_methods
    patterns = { ".git", "Makefile", "package.json" },
  })

  local telescope = require("telescope")
  telescope.load_extension("projects")
  telescope.load_extension("file_browser")
  -- require("which-key").register({ ["<leader>fp"] = { ":Telescope projects<CR>", "Find projects" } })
end

local function config_telescope()
  local telescope = require("telescope")
  local actions = require("telescope.actions")
  local builtin = require("telescope.builtin")
  telescope.setup({
    defaults = {
    
      prompt_prefix = " | " , --  "
      selection_caret = " ",
      path_display = { "smart" },
      file_ignore_patterns = { ".git/", "node_modules" },

      mappings = {
        i = {
          ["<C-c>"] = actions.close,
          ["<Down>"] = actions.cycle_history_next,
          ["<Up>"] = actions.cycle_history_prev,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
        n = { q = actions.close, },
      },
    },
  })

  -- whichkey keybinds
  local register = require("which-key").register
  register({
    f = {
      name = "Telescope",
      f = { builtin.find_files, "Find files" },
      t = { builtin.live_grep, "Live grep" },
      b = { builtin.buffers, "Find buffers" },
      h = { builtin.help_tags, "Neovim documentation" },
      l = { builtin.diagnostics, "LSP diagnostics" },
      a = { builtin.builtin, "Select a builtin picker" },
      e = { ":Telescope file_browser<CR>", "File browser" },
      r = { ":luafile ~/.config/nvim/init.lua<CR>", "Refresh Settings" } -- REMOV 
    },
  }, { prefix = "<leader>" })
end

return {
  { "nvim-telescope/telescope.nvim", config = config_telescope, requires = { "folke/which-key.nvim", "nvim-lua/plenary.nvim"} },
  { "ahmedkhalf/project.nvim", config = config_project, after = "telescope.nvim", },
  { "nvim-telescope/telescope-fzf-native.nvim", run = 'make', }, 
  { "nvim-telescope/telescope-file-browser.nvim" }
}
