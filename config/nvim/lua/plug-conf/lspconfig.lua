-- keybinds
local function lsp_keymaps()
  local register = require("which-key").register
  local base = {
    g = {
      name = "LSP info",
      D = { vim.lsp.buf.declaration, "Declaration" },
      d = { vim.lsp.buf.definition, "Definition" },
      I = { vim.lsp.buf.implementation, "Implementation" },
      r = { vim.lsp.buf.references, "References" },
      l = { vim.diagnostic.open_float, "Diagnostics" },
    },
    K = { vim.lsp.buf.hover, "Inspect" },
    ["<leader>l"] = {
      name = "LSP info",
      i = { "<cmd>LspInfo<cr>", "LSP info" },
      a = { vim.lsp.buf.code_action, "Code actions" },
      r = { vim.lsp.buf.rename, "Rename" },
      s = { vim.lsp.buf.signature_help, "Signature" },
      q = { vim.diagnostic.setloclist, "Show all diagnostics" },
      l = { vim.lsp.codelens.run, "Run codelens" },
      j = { function() vim.diagnostic.goto_next({ buffer = bufnr }) end, "Next diagnostic", },
      k = { function() vim.diagnostic.goto_prev({ buffer = bufnr }) end, "Prev diagnostic", },
    },
  }
  register(base)
end

local function config()
  require('mason-lspconfig').setup()

  -- Automatically setup LSP servers
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }

  require('mason-lspconfig').setup_handlers {
    function(server_name)
      lsp_keymaps()
      require('lspconfig')[server_name].setup {
        capabilities = capabilities,
      }
    end,
  }
end

return {
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim", config = config }, 
  { "neovim/nvim-lspconfig" },
}
-- require('ufo').setup()

