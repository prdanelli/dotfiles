require("alpha").setup(require("alpha.themes.startify").opts)

-- Show the dashboard
vim.api.nvim_set_keymap("n", "<leader>s", "<cmd>Alpha<cr>", { noremap = true, silent = true })
