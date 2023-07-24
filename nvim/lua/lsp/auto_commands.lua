M = {}

local api = vim.api

local highlight_cmd_group = vim.api.nvim_create_augroup("Highlight", {
  clear = true,
})

M.setup = function(client, bufnr)
  -- if client.server_capabilities.documentFormattingProvider then
  --   api.nvim_create_autocmd("BufWritePre", {
  --     callback = function()
  --       vim.lsp.buf.format({ timeout_ms = 2000 })
  --     end,
  --
  --     group = api.nvim_create_augroup("Format", {
  --       clear = true,
  --     }),
  --   })
  -- end

  if client.server_capabilities.documentHighlightProvider then
    -- Highlight word under cursor on hold
    api.nvim_create_autocmd("CursorHold", {
      callback = vim.lsp.buf.document_highlight,
      group = highlight_cmd_group,
      buffer = bufnr
    })

    -- Clear highlights on cursor move
    api.nvim_create_autocmd("CursorMoved", {
      callback = vim.lsp.buf.clear_references,
      group = highlight_cmd_group,
      buffer = bufnr
    })
  end
end

return M
