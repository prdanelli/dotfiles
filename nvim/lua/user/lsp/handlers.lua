local M  = {}

M.on_attach = function(client)
  local opts = { buffer = 0 }

  -- Generate LSP functionality
  vim.keymap.set('n', 'K',  vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)

  -- Navigate diagnotis errors/mesages
  vim.keymap.set('n', 'gk', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', 'gj', vim.diagnostic.goto_prev, opts)

  -- Telescope helpers for listing symbols and diagnostics
  vim.keymap.set('n', '<leader>fs', '<cmd>Telescope lsp_document_symbols<cr>', opts)
  vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>', opts)

  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]

  print("Attached to " .. client.name)
end

M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  vim.diagnostic.config({
    virtual_text = false,
    signs = { active = signs },
    update_in_insert = true,
    underline = false,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  })

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M

