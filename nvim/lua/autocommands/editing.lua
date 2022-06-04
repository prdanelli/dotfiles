vim.api.nvim_create_augroup("_editing", { clear = true })

-- Enable spell check and word wrap for certain file types
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = "_editing",
  pattern = { "*.txt", "*.md", "*.tex" },
  callback = function()
    vim.cmd("setlocal spell")
    vim.cmd("setlocal wrap")
  end,
})

-- Prevent IndentLine from hiding ``` in markdown files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = "_editing",
  pattern = { "*.md" },
  callback = function()
    vim.g["indentLine_enabled"] = "0"
  end,
})
