-------------------------------------------------------------------------------
-- General Keybindings, not plugin specific
-------------------------------------------------------------------------------
local opts = { silent = true }

-- Set the leader key
vim.keymap.set("", ",", "<Nop>", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Turn off arrow keys - force HJKL
vim.keymap.set("n", "<UP>", "<NOP>", opts)
vim.keymap.set("n", "<DOWN>", "<NOP>", opts)
vim.keymap.set("n", "<LEFT>", "<NOP>", opts)
vim.keymap.set("n", "<RIGHT>", "<NOP>", opts)

-- Experiment as esc is in a wierd place and I miss it a lot
vim.keymap.set("i", "<esc>", "<cmd>lua vim.notify('Use C-c or jj dumbass', 'info')<cr><esc>", opts)


-- Map ctrl-c to esc
vim.keymap.set("i", "<C-c>", "<esc>", opts)

-- Use Del key for black hole register
vim.keymap.set("", "<Del>", '"_x', opts)

-- Paste over selected text
vim.keymap.set("v", "p", '"_dP', opts)

-- Select all
vim.keymap.set("n", "<C-s>", "ggVG", opts)

-- Better Indentation
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Move text up and down
vim.keymap.set("v", "<A-j>", ":m .+1<CR>==", opts)
vim.keymap.set("v", "<A-k>", ":m .-2<CR>==", opts)

-- Insert lines above/below without leaving normal mode
vim.keymap.set("n", "oo", "o<Esc>k", opts)
vim.keymap.set("n", "OO", "O<Esc>j", opts)

-- Remove highlighting
vim.keymap.set("n", "<leader>c", "<cmd>noh<cr>", opts)

-- Alternatives to :w, because I constantly typo it
vim.keymap.set("n", "<C-w>", "<cmd>w<cr>", opts)

-- Map jj to esc
vim.keymap.set("i", "jj", "<esc>", opts)

-- Ctrl-c to esc
vim.keymap.set("i", "<C-c>", "<esc>", opts)

-- Copy the current file path
vim.keymap.set("n", "yp", '<cmd>let @+ = expand("%:p")<cr>', opts)

-------------------------------------------------------------------------------
-- Buffers
-------------------------------------------------------------------------------
-- Delete buffer
vim.keymap.set("n", "<Leader>bd", ":Bdelete<CR>", opts)
vim.keymap.set("n", "<Leader>d", ":bd<CR>", opts)

-- Close a buffer without closing the split
vim.keymap.set("n", "<leader>bd", ":lclose<bar>b#<bar>bd #<CR>", opts)

-- Buffer navigation with ctrl+lh
vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)

-------------------------------------------------------------------------------
-- Splits
-------------------------------------------------------------------------------
vim.keymap.set("n", "<Leader>\\", ":vsplit<CR>", opts)
vim.keymap.set("n", "<Leader>-", ":split<CR>", opts)

-- Resize splits with alt+cursor keys
vim.keymap.set("n", "<M-Up>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<M-Down>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<M-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<M-Right>", ":vertical resize +2<CR>", opts)
