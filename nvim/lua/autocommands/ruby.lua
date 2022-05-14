vim.api.nvim_create_augroup("_ruby", { clear = true })

-- Set Active Admin .arb files to be ruby files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = "_ruby",
  pattern = "*.arb",
  callback = function() vim.cmd("setfiletype ruby") end,
})

