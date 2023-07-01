local lazy_loaded, _ = pcall(require, "lazy")
if not lazy_loaded then return end

vim.api.nvim_create_augroup("_lazy", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = "_lazy",
  pattern = "lazy",
  callback = function()
    vim.cmd("setlocal nonumber colorcolumn= | autocmd BufUnload set colorcolumn=80,120")
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