M = {}

function M.setup(_, bufnr)
  local opts = { silent = true, remap = false, buffer = bufnr }

  -- Generate LSP functionality
  vim.keymap.set("n", "K",  vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "ge", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)

  -- Navigate diagnotis errors/mesages
  vim.keymap.set("n", "gk", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "gj", vim.diagnostic.goto_prev, opts)

  -- Telescope helpers for listing symbols and diagnostics
  vim.keymap.set("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", opts)
  vim.keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", opts)
end

return M
