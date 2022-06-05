vim.api.nvim_create_augroup("_skhd", { clear = true })

-- Set Active Admin .arb files to be ruby files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = "_skhd",
  pattern = "skhdrc",
  callback = function() vim.cmd("setfiletype bash") end,
})

