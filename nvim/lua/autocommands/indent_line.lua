vim.api.nvim_create_augroup("_which_key", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = "_which_key",
  pattern = { "WhichKey", "packer", "lsp-installer", "terminal", },
  callback = function()
    vim.cmd("IndentLinesToggle")
  end,
})
