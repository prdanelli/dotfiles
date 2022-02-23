-------------------------------------------------------------------------------
-- General Keybindings, not plugin specific
-------------------------------------------------------------------------------
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Set the leader key
keymap("", ",", "<Nop>", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Turn off arrow keys - force HJKL
keymap("n", "<UP>", "<NOP>", opts)
keymap("n", "<DOWN>", "<NOP>", opts)
keymap("n", "<LEFT>", "<NOP>", opts)
keymap("n", "<RIGHT>", "<NOP>", opts)

-- Map jj to esc
keymap("i", "jj", "<esc>", { silent = true })
--
-- Map ctrl-c to esc
keymap("i", "<C-c>", "<esc>", { silent = true })

-- Use Del key for black hole register
keymap("", "<Del>", '"_x', { silent = true })

-- Paste over selected text
keymap("v", "p", '"_dP', opts)

-- Select all
keymap("n", "<C-s>", "ggVG", opts)

-- Better Indentation
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Insert lines above/below without leaving normal mode
keymap("n", "oo", "o<Esc>k", opts)
keymap("n", "OO", "O<Esc>j", opts)

-- Remove highlighting
keymap("n", "<leader>c", "<cmd>noh<cr>", opts)

-- Alternatives to :w, because I constantly typo it
keymap("n", "<C-w>", "<cmd>w<cr>", opts)

-- Remap V to highlight the remainder of the line
-- keymap("n", "V", "vg_", { silent = true })

-- vv to highlight entire line
-- keymap("n", "vv", "0v$", opts)

keymap("i", "<C-c>", "<esc>", opts)
keymap("n", "<leader>y", '"+y', opts)

-------------------------------------------------------------------------------
-- Buffers
-------------------------------------------------------------------------------
-- Delete buffer
keymap("n", "<Leader>d", ":bdelete<CR>", opts)

-- Close a buffer without closing the split
keymap("n", "<leader>bd", ":lclose<bar>b#<bar>bd #<CR>", opts)

-- Buffer navigation with ctrl+lh
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)

-------------------------------------------------------------------------------
-- Splits
-------------------------------------------------------------------------------
keymap("n", "<Leader>\\", ":vsplit<CR>", opts)
keymap("n", "<Leader>-", ":split<CR>", opts)

-- Resize splits with alt+cursor keys
keymap("n", "<M-Up>", ":resize +2<CR>", opts)
keymap("n", "<M-Down>", ":resize -2<CR>", opts)
keymap("n", "<M-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<M-Right>", ":vertical resize +2<CR>", opts)
