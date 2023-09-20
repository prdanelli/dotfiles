vim.api.nvim_create_augroup("_editing", { clear = true })

-- Enable spell check and word wrap for certain file types
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = "_editing",
  pattern = { "gitcommit", "markdown", "txt" },
  desc = "Enable spell checking and text wrapping for certain filetypes",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Prevent IndentLine from hiding ``` in markdown files
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = "_editing",
  pattern = { "markdown" },
  callback = function()
    vim.g["indentLine_enabled"] = 0
    vim.g["markdown_syntax_conceal"] = 0
  end,
})
