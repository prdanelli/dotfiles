vim.api.nvim_create_augroup("_general", { clear = true })

-- Close different buffers with `q`
vim.api.nvim_create_autocmd("FileType", {
  group = "_general",
  pattern = "qf,help,man,lspinfo,startuptime,neotest-summary",
  callback = function() vim.cmd("nnoremap <silent><buffer> q :close<cr>") end,
})

-- Adjust how text is formatted
vim.api.nvim_create_autocmd("BufWinEnter", {
  group = "_general",
  pattern = "*",
  callback = function() vim.cmd("set formatoptions-=cro") end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = "_general",
  pattern = "qf",
  callback = function() vim.cmd("set nobuflisted") end,
})

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd('BufReadPost', {
  group    = "_general",
  pattern  = "*",
  callback = function()
    if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
      vim.fn.setpos('.', vim.fn.getpos("'\""))
      -- vim.cmd('normal zz') -- how do I center the buffer in a sane way??
      vim.cmd("silent! foldopen")
    end
  end
})

-- Run resize methods when window size is changes
vim.api.nvim_create_autocmd("VimResized", {
  group = "_general",
  pattern = "*",
  callback = function() vim.cmd("tabdo wincmd =") end,
})
