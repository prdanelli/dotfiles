local options = {
  scratchpad_autostart = 0,
  scratchpad_location = "~/Personal/Dropbox/Documents/Scratchpad/scratchpad.md",
  scratchpad_autofocus = 1,
  scratchpad_autosize = 0,
  scratchpad_minwidth = 60,
}

for k, v in pairs(options) do
  vim.g[k] = v
end

vim.api.nvim_create_augroup("_scratchpad", { clear = true })

-- -- Close scratchpad with q
vim.api.nvim_create_autocmd("FileType", {
  group = "_scratchpad",
  pattern = "scratchpad",
  callback = function()
    vim.cmd("nnoremap <silent><buffer> q :ScratchPad<cr>")
    vim.cmd("setlocal nospell")
    vim.cmd("setlocal wrap")
    vim.cmd("set filetype=markdown")
  end,
})
