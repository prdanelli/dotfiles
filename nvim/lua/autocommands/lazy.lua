local lazy_loaded, _ = pcall(require, "lazy")
if not lazy_loaded then return end

vim.api.nvim_create_augroup("_lazy", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = "_lazy",
  pattern = "lazy",
  callback = function()
    vim.cmd("set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2")
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = "_lazy",
  pattern = "lazy",
  callback = function()
    vim.cmd("setlocal nonumber colorcolumn=")
  end,
})


local colorizer_loaded, _ = pcall(require, "colorizer")
if colorizer_loaded then
  vim.api.nvim_create_autocmd("FileType", {
    group = "_lazy",
    pattern = "lazy",
    callback = function() vim.cmd("ColorizerDetachFromBuffer") end,
  })
end