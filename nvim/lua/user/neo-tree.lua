require("neo-tree").setup()

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>lua require('neo-tree').show()<cr>", opts)
