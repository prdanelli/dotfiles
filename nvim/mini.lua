vim.cmd('pa rnvimr')
vim.g.rnvimr_vanilla = 1
vim.defer_fn(function()
    vim.cmd('RnvimrToggle')
end, 100)
