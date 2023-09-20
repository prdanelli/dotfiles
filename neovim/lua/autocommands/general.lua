vim.api.nvim_create_augroup("_general", { clear = true })

-- Close different buffers with `q`
vim.api.nvim_create_autocmd("FileType", {
  group = "_general",
  pattern = "qf,help,man,lspinfo,startuptime,neotest-summary",
  callback = function()
    vim.cmd("nnoremap <silent><buffer> q :close<cr>")
  end,
})

-- Adjust how text is formatted
vim.api.nvim_create_autocmd("BufWinEnter", {
  group = "_general",
  pattern = "*",
  callback = function()
    vim.cmd("set formatoptions-=cro")
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = "_general",
  pattern = "qf",
  callback = function()
    vim.cmd("set nobuflisted")
  end,
})

-- Run resize methods when window size is changes
vim.api.nvim_create_autocmd("VimResized", {
  group = "_general",
  pattern = "*",
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- create directories when needed, when saving a file
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("better_backup", { clear = true }),
  callback = function(event)
    local file = vim.loop.fs_realpath(event.match) or event.match
    local backup = vim.fn.fnamemodify(file, ":p:~:h")
    backup = backup:gsub("[/\\]", "%%")
    vim.go.backupext = backup
  end,
})
