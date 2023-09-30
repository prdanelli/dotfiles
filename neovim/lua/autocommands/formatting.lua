vim.api.nvim_create_augroup("_formatting", { clear = true })

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
  group = highlight_group,
  pattern = "*",
})

-- vim.cmd [[highlight IncSearch cterm=reverse gui=reverse]]
