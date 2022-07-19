vim.api.nvim_create_augroup("_colorizer", { clear = true })

-- Close different buffers with `q`
vim.api.nvim_create_autocmd("FileType", {
  group = "_colorizer",
  pattern = "packer",
  callback = function() vim.cmd("<cmd>ColorizerDetachFromBuffer <cr>") end,
})

