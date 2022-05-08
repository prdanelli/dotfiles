require("alpha").setup(require("alpha.themes.startify").opts)

-- Show the dashboard
vim.keymap.set("n", "<leader>s", "<cmd>Alpha<cr>", { silent = true })
