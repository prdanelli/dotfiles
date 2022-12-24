local plugin_loaded, alpha = pcall(require, "colorizer")
if not plugin_loaded then return end

vim.api.nvim_create_augroup("_colorizer", { clear = true })

-- Close different buffers with `q`
vim.api.nvim_create_autocmd("FileType", {
  group = "_colorizer",
  pattern = "packer",
  callback = function() vim.cmd("<cmd>ColorizerDetachFromBuffer <cr>") end,
})

