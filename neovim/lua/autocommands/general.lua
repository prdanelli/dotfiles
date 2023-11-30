vim.api.nvim_create_augroup("_general", { clear = true })

-- Close different buffers with `q`
vim.api.nvim_create_autocmd("FileType", {
  group = "_general",
  pattern = "qf,help,man,lspinfo,startuptime,neotest-summary",
  callback = function()
    vim.cmd("nnoremap <silent><buffer> q :close<cr>")
  end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
  group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
  pattern = "*",
})

-- Don't list quick list in buffer list and so bnext etc dont toggle to it
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
    local current_tab = vim.fn.tabpagenr()

    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = "_general",
  callback = function(event)
    if event.match:match("^%w%w+://") then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})
