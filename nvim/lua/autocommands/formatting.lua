vim.api.nvim_create_augroup("_formatting", { clear = true })

-- Strip trailing whitespaces on save
vim.api.nvim_create_autocmd("BufWritePre", {
  group = "_formatting",
  pattern = "*",
  command = "%s/\\s\\+$//e"
})

