-------------------------------------------------------------------------------
-- General Keybindings, not plugin specific
-------------------------------------------------------------------------------
local opts = { silent = true }

-- Set the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Turn off arrow keys - force HJKL
vim.keymap.set("n", "<UP>", "<NOP>", opts)
vim.keymap.set("n", "<DOWN>", "<NOP>", opts)
vim.keymap.set("n", "<LEFT>", "<NOP>", opts)
vim.keymap.set("n", "<RIGHT>", "<NOP>", opts)

-- Map ctrl-c to esc
vim.keymap.set("i", "<C-c>", "<esc>", opts)

-- Use Del key for black hole register
vim.keymap.set("", "<Del>", '"_x', opts)

-- Paste over selected text
vim.keymap.set("v", "p", '"_dP', opts)

-- Better Indentation
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Insert lines above/below without leaving normal mode
vim.keymap.set("n", "oo", "o<Esc>k", opts)
vim.keymap.set("n", "OO", "O<Esc>j", opts)

-- Remove highlighting
vim.keymap.set("n", "<leader>c", "<cmd>noh<cr>", opts)

-- Alternatives to :w, because I constantly typo it
vim.keymap.set("n", "<c-s>", "<NOP>", opts)
vim.keymap.set("i", "<c-s>", "<NOP>", opts)
vim.keymap.set("n", "<c-s>", "<cmd>w<cr>", opts)
vim.keymap.set("i", "<c-s>", "<esc><cmd>w<cr>", opts)

-- Map jj to esc
vim.keymap.set("i", "jj", "<esc>", opts)

-- Ctrl-c to esc
vim.keymap.set("i", "<C-c>", "<esc>", opts)

-- Escape in normal mode seems to tab
vim.keymap.set("n", "<esc>", "<NOP>", opts)

-- Navigate quicklist items
vim.keymap.set("n", "gn", "<cmd>cnext<cr>")
vim.keymap.set("n", "gp", "<cmd>cprev<cr>")

-------------------------------------------------------------------------------
-- Buffers
-------------------------------------------------------------------------------
-- Delete buffer
vim.keymap.set("n", "<c-w>", ":bd<CR>", opts)

-- Navigate buffers
vim.keymap.set("n", "bn", ":bnext<CR>", opts)
vim.keymap.set("n", "BN", ":bprevious<CR>", opts)

vim.keymap.set("n", "<c-]>", ":bnext<CR>", opts)
vim.keymap.set("n", "<c-[>", "", opts)
vim.keymap.set("n", "<c-[>", ":bprevious<CR>", opts)

-------------------------------------------------------------------------------
-- Splits
-------------------------------------------------------------------------------
-- Resize splits with alt+cursor keys
vim.keymap.set("n", "<M-Up>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<M-Down>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<M-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<M-Right>", ":vertical resize +2<CR>", opts)

