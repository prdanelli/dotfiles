vim.api.nvim_create_augroup("_formatting", { clear = true })

-- Strip trailing whitespaces on save
vim.api.nvim_create_autocmd("BufWritePre", {
  group = "_formatting",
  pattern = "*",
  command = "%s/\\s\\+$//e"
})

-- Prevent stripping EOL on save
-- vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead", "BufWritePost" }, {
--   group = "_formatting",
--   pattern = "*",
--   command = "setl fixeol"
-- })
