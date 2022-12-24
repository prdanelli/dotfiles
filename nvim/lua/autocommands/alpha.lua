local plugin_loaded, alpha = pcall(require, "alpha")
if not plugin_loaded then return end

vim.api.nvim_create_augroup("_alpha", { clear = true })

-- Alpha Specific fixes to adjust the display
vim.api.nvim_create_autocmd("User", {
  group = "_alpha",
  pattern = "AlphaReady",
  callback = function()
    vim.cmd("set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2")
    vim.cmd("IndentLinesToggle")
  end,
})
