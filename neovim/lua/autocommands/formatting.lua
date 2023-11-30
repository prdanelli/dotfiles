vim.api.nvim_create_augroup("_formatting", { clear = true })

-- Adjust how text is formatted
vim.api.nvim_create_autocmd("BufWinEnter", {
  group = "_formatting",
  pattern = "*",
  callback = function()
    vim.cmd("set formatoptions-=cro")
  end,
})
