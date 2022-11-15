local function config()
  local util = require("Comment.utils")
  --[[ local api = require("Comment.api") ]]
  require("Comment").setup({
    ignore = "^$",
    toggler = {
      line = "<leader>cc",
      block = "<leader>bb",
    },
    opleader = {
      line = "<leader>c",
      block = "<leader>b",
    },
    mappings = {
      basic = true,
      extra = true,
      block = true,
    },
  })
end

return {
  "numToStr/Comment.nvim",
  config = config,
  requires = { "folke/which-key.nvim" },
}
