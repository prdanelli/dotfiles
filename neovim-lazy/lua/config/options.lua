local options = {
  backup = false, -- creates a backup file
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  cmdheight = 1, -- 0 = off, more space in the neovim command line for displaying messages
  colorcolumn = "80,120",
  conceallevel = 0, -- so that `` is visible in markdown files
  confirm = false,
  fixendofline = false, -- Prevent Nvim from removing end of file new line
  number = true, -- set numbered lines
  relativenumber = true, -- set relative numbered lines
  showtabline = 0, -- 0: never, 1: only if there are at least two tab pages, 2: always
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  splitright = true, -- force all vertical splits to go to the right of current window
  swapfile = false,
  termguicolors = true,
  timeoutlen = 200, -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true, -- enable persistent undo
  wrap = true,
  writebackup = false, -- if a file is being edited by another program
  mousescroll = "ver:1,hor:0",
  smoothscroll = true,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.g.snacks_animate = false
vim.g.editorconfig = false
vim.opt.whichwrap:append("<>[]hl") -- go to previous/next line with h,l
vim.g.ruby_host_prog = "/Users/paul/.asdf/shims/neovim-ruby-host" -- avoid needing to install this in every project

vim.opt.iskeyword:append({ "_", "-" })

-- Ensure I dont freak out by hitting the cap w when exiting
vim.cmd([[
  cnoreabbrev Wq wq
  cnoreabbrev wQ wq
  cnoreabbrev WQ wq
  cnoreabbrev W w
  cnoreabbrev Q q
]])
