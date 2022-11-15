local sonokai = {
  "sainnhe/sonokai",

  config = function()

    vim.g.sonokai_better_performance = 1
    vim.g.sonokai_style = "atlantis"
    vim.cmd("colorscheme sonokai")
  end,
}
return sonokai
