-- require('nvim-treesitter.configs').setup({
--  ensure_installed = { 'cpp', 'json', 'javascript', 'lua', 'markdown', 'haskell', 'python' },
--  sync_install = true,
--  highlight = { enable = true, additional_vim_regex_highlighting = false, }, 
--  matchparen = { enable = true },
--  indent = { enable = true },
-- })

local function config()
  require("nvim-treesitter.configs").setup({
    -- ensure_installed = { 'cpp', 'json' , 'javascript', 'lua', 'markdown', 'haskell', 'python' },
    ensure_installed = "all",
    highlight = {
      enable = true,
    },
    autopairs = {
      enable = true,
    },
    autotag = {
      enable = true,
    },
    rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = nil,
    },
    indent = { enable = true, disable = { "python", "css" } },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
          ["aa"] = "@parameter.outer",
          ["ia"] = "@parameter.inner",
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ["<leader>a"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader>A"] = "@parameter.inner",
        },
      },
    },
  })
end

return {
  "nvim-treesitter/nvim-treesitter",
  config = config,
  requires = { "nvim-treesitter/nvim-treesitter-textobjects" },
}
