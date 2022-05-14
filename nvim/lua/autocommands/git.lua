vim.api.nvim_create_augroup("_git", { clear = true })

-- Enable spell check and word wrap for git commits
vim.api.nvim_create_autocmd("FileType", {
  group = "_git",
  pattern = "gitcommit",
  callback = function()
    vim.cmd("setlocal spell")
    vim.cmd("setlocal wrap")
  end,
})
