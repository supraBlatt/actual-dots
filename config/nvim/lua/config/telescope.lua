tls = require('telescope')

tls.setup {
  defaults = { prompt_prefix = " | " },
  pickers = { },
  extensions = { }
}

tls.load_extension("file_browser")
tls.load_extension("ui-select")
