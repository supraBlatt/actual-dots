-- forknite battle pass
--    /|
--   / | 
--  /  |
--  \  |
--   \ |
--    ||
--    ||
--    ||
--    ||

local _, _ = pcall(require, "impatient")
_G.do_auto_format = true
_G.symbols = {
  -- File = "",
  -- Module = "",
  Namespace = "",
  Package = "",
  Class = "𝓒",
  Method = "",
  Property = "",
  -- Field = "",
  Constructor = "",
  Enum = "ℰ",
  -- Interface = "ﰮ",
  Function = "λ",
  -- Function = "",
  Variable = "",
  Constant = "",
  String = "𝓐",
  Number = "#",
  Boolean = "⊨",
  Array = "",
  Object = "⦿",
  Key = "🔐",
  Null = "",
  EnumMember = "",
  Struct = "𝓢",
  -- Event = "🗲",
  -- Operator = "+",
  -- TypeParameter = "𝙏",
  -- Class = "",
  Color = "",
  -- Constant = "",
  -- Constructor = "",
  -- Enum = "",
  Event = "",
  Field = "",
  File = "",
  Folder = "",
  -- Function = "",
  Interface = "",
  Keyword = "",
  -- Method = "",
  Module = "",
  Operator = "",
  -- Property = "",
  Reference = "",
  Snippet = "",
  -- Struct = "",
  Text = "",
  TypeParameter = "",
  Unit = "",
  Value = "",
  Copilot = "",
  -- Copilot = "",
  -- Variable = "",
}

require('impatient')
require('plugins')
require('settings/options')
-- require('settings/keybinds')
require('autocmd')
