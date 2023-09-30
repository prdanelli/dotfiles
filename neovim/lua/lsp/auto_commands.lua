M = {}

local api = vim.api

local highlight_cmd_group = vim.api.nvim_create_augroup("Highlight", {
  clear = true,
})

M.setup = function(client, bufnr)
  if client.server_capabilities.documentHighlightProvider then
    -- Highlight word under cursor on hold
    api.nvim_create_autocmd("CursorHold", {
      group = highlight_cmd_group,
      callback = vim.lsp.buf.document_highlight,
      buffer = bufnr,
    })

    -- Clear highlights on cursor move
    api.nvim_create_autocmd("CursorMoved", {
      group = highlight_cmd_group,
      callback = vim.lsp.buf.clear_references,
      buffer = bufnr,
    })
  end
end

return M
