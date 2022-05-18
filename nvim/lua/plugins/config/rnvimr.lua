local colors = require("colors").colors
local options = {
  rnvimr_enable_ex = 1, -- Make Ranger replace netrw and be the file explorer
  rnvimr_enable_picker = 1, -- Make Ranger to be hidden after picking a file
  rnvimr_draw_border = 0, -- Border for floating window
  rnvimr_hide_gitignore = 1, -- Hide the files included in gitignore
  rnvimr_enable_bw = 1, -- Make Neovim wipe the buffers corresponding to the files deleted by Ranger
  rnvimr_shadow_winblend = 50, -- Add a shadow window, value is equal to 100 will disable shadow
  rnvimr_ranger_cmd = { 'ranger' }, -- Draw border with both
  rnvimr_ranger_views = [[
    [ \	{'minwidth': 90, 'ratio': []}, \	{'minwidth': 90, 'maxwidth': 89, 'ratio': [1,1]}, \	{'maxwidth': 90, 'ratio': [1]} ]
  ]],
  -- rnvimr_border_attr = [[{'fg': 14, 'bg': -1}]]
}

for k, v in pairs(options) do
  vim.g[k] = v
end

-- Link CursorLine into RnvimrNormal highlight in the Floating window
vim.cmd[[highlight link RnvimrNormal CursorLine]]

vim.keymap.set("n", "<leader>e", "<cmd>RnvimrToggle<CR>", { noremap = true, silent = true })

