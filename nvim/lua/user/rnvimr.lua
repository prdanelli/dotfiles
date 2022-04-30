vim.keymap.set("n", "<leader>e", "<cmd>Rnvimr<CR>", { silent = true })

-- Make Ranger replace netrw and be the file explorer
vim.g["rnvimr_ex_enable"] = 1

-- Make Ranger to be hidden after picking a file
vim.g["rnvimr_enable_picker"] = 1

-- Border for floating window
vim.g["rnvimr_draw_border"] = 1

-- Hide the files included in gitignore
vim.g["rnvimr_hide_gitignore"] = 1

-- Make Neovim wipe the buffers corresponding to the files deleted by Ranger
vim.g["rnvimr_enable_bw"] = 1

-- Add a shadow window, value is equal to 100 will disable shadow
vim.g["rnvimr_shadow_winblend"] = 70

-- Draw border with both
vim.g["rnvimr_ranger_cmd"] = 'ranger --cmd="set draw_borders both"'

-- Link CursorLine into RnvimrNormal highlight in the Floating window
vim.cmd[[highlight link RnvimrNormal CursorLine]]

vim.g["rnvimr_ranger_views"] = [[
[
\	{'minwidth': 90, 'ratio': []},
\	{'minwidth': 90, 'maxwidth': 89, 'ratio': [1,1]},
\	{'maxwidth': 90, 'ratio': [1]}
]
]]

vim.api.nvim_set_keymap("n", "<leader>e", "<cmd>RnvimrToggle<CR>", { noremap = true, silent = true })
