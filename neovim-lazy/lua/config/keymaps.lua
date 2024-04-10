-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set<cmd> https<cmd>//github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-------------------------------------------------------------------------------
-- Delete Default Keymaps
-------------------------------------------------------------------------------

-- new file
vim.keymap.del("n", "<leader>fn")

-- default nerd tree
vim.keymap.del("n", "<leader>fe")

-- floating terminal
vim.keymap.del("n", "<leader>fT")
vim.keymap.del("n", "<leader>ft")

-------------------------------------------------------------------------------
-- Custom
-------------------------------------------------------------------------------

local opts = { silent = true }

-- Use x and Del key for black hole register
vim.keymap.set("", "<Del>", '"_x', opts)
vim.keymap.set("", "x", '"_x', opts)

-- Paste over selected text
vim.keymap.set("v", "p", '"_dP', opts)

-- Better Indentation
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- move lines
vim.keymap.set("v", "J", "<cmd>m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", "<cmd>m '<-2<CR>gv=gv")

-- Insert lines above/below without leaving normal mode
vim.keymap.set("n", "oo", "o<Esc>k", opts)
vim.keymap.set("n", "OO", "O<Esc>j", opts)

-- Remove highlighting
vim.keymap.set("n", "<leader>c", "<cmd>noh<cr>", opts)
vim.keymap.set("n", "<esc><esc>", "<esc><cmd>noh<cr><esc>", opts)

-- Alternatives to <cmd>w, because I constantly typo it
vim.keymap.set({ "i", "n", "v" }, "<c-s>", "<NOP>", opts)
vim.keymap.set({ "i", "n", "v" }, "<c-s>", "<esc><cmd>w<cr>", opts)

-- Navigate quicklist items
vim.keymap.set("n", "gn", "<cmd>cnext<cr>", opts)
vim.keymap.set("n", "gp", "<cmd>cprev<cr>", opts)

-- Add line break and jump to start
vim.keymap.set("n", "<Enter>", "i<Enter><Esc>^", opts)

vim.keymap.set(
  { "n", "v" },
  "<leader>fe",
  "<cmd>lua require('ranger-nvim').open(true)<cr>",
  { desc = "Ranger", silent = true }
)

-- Get current filetype
vim.keymap.set("n", "<c-x>", "<cmd>echo &filetype<cr>", opts)

vim.keymap.set("n", "<leader>yf", "<cmd>let @+ = expand('%:p')<cr>", { desc = "Full Path", silent = true })
vim.keymap.set("n", "<leader>yr", "<cmd>let @+ = expand('%:~:.')<cr>", { desc = "Relative Path", silent = true })

-------------------------------------------------------------------------------
-- Buffers
-------------------------------------------------------------------------------
-- Delete buffer
vim.keymap.set("n", "<c-w>", "<cmd>bd<CR>", opts)

-- Navigate buffers
vim.keymap.set("n", "bn", "<cmd>bnext<CR>", opts)
vim.keymap.set("n", "bl", "<cmd>bnext<CR>", opts)
vim.keymap.set("n", "bv", "<cmd>bprevious<CR>", opts)
vim.keymap.set("n", "bh", "<cmd>bprevious<CR>", opts)
vim.keymap.set("n", "BN", "<cmd>bprevious<CR>", opts)

vim.keymap.set("n", "<c-]>", "<cmd>bnext<CR>", opts)
vim.keymap.set("n", "<c-[>", "", opts)
vim.keymap.set("n", "<c-[>", "<cmd>bprevious<CR>", opts)
