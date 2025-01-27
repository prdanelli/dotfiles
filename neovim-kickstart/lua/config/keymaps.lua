-------------------------------------------------------------------------------
-- General Keybindings, not plugin specific
-------------------------------------------------------------------------------
local opts = { silent = true }

vim.keymap.set("n", "<leader>d", "<cmd>Snacks.dashboard.open()<cr>", { desc = "[D]ashboard", silent = true })
vim.keymap.set("n", "<leader>\\", "<cmd>vsplit<cr>", { desc = "Vertical Split", silent = true })
vim.keymap.set("n", "<leader>-", "<cmd>split<cr>", { desc = "Horizontal Split", silent = true })

-- Turn off arrow keys - force HJKL
vim.keymap.set("n", "<UP>", "<NOP>", opts)
vim.keymap.set("n", "<DOWN>", "<NOP>", opts)
vim.keymap.set("n", "<LEFT>", "<NOP>", opts)
vim.keymap.set("n", "<RIGHT>", "<NOP>", opts)

vim.keymap.set({ "n", "t", "v", "i", "" }, "<C-x>", "<cmd>echo &filetype<cr>", opts)

-- Map ctrl-c to esc
vim.keymap.set("i", "<C-c>", "<esc>", opts)

-- Use x and Del key for black hole register
vim.keymap.set("", "<Del>", '"_x', opts)
vim.keymap.set("", "x", '"_x', opts)

-- Paste over selected text
vim.keymap.set("v", "p", '"_dP', opts)

-- Insert lines above/below without leaving normal mode
vim.keymap.set("n", "oo", "o<Esc>k", opts)
vim.keymap.set("n", "OO", "O<Esc>j", opts)

-- Remove highlighting
vim.keymap.set("n", "<esc><esc>", "<esc><cmd>noh<cr><esc>", opts)

-- Alternatives to :w, because I constantly typo it
vim.keymap.set({ "i", "n", "v" }, "<c-s>", "<NOP>", opts)
vim.keymap.set({ "i", "n", "v" }, "<c-s>", "<esc><cmd>w<cr>", opts)

-- Map to esc
vim.keymap.set("i", "<C-c>", "<esc>", opts)

-- Escape in normal mode seems to tab
vim.keymap.set("n", "<esc>", "<NOP>", opts)

-- Add line break and jump to start
vim.keymap.set("n", "<Enter>", "a<Enter><Esc>^", opts)

-- Delete buffer
vim.keymap.set("n", "<c-w>", ":bd<CR>", opts)

vim.keymap.set("n", "<leader>yr", "<cmd>let @+ = expand('%:~:.')<cr>", { desc = "Relative Path", silent = true })
vim.keymap.set("n", "<leader>yf", "<cmd>let @+ = expand('%:p')<cr>", { desc = "Full Path", silent = true })

-------------------------------------------------------------------------------
-- Splits
-------------------------------------------------------------------------------
-- Resize splits with alt+cursor keys
vim.keymap.set({ "n", "i", "v" }, "<A-j>", "<nop>")
vim.keymap.set({ "n", "i", "v" }, "<A-k>", "<nop>")
vim.keymap.set({ "n", "i", "v" }, "<M-j>", "<nop>")
vim.keymap.set({ "n", "i", "v" }, "<M-k>", "<nop>")

vim.keymap.set("n", "<M-Up>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<M-Down>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<M-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<M-Right>", ":vertical resize +2<CR>", opts)

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
