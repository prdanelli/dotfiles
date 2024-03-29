local options = {
  background = "dark",
  backup = false, -- creates a backup file
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  cmdheight = 1, -- 0 = off, more space in the neovim command line for displaying messages
  colorcolumn = "80,120",
  completeopt = { "menu", "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0, -- so that `` is visible in markdown files
  cursorline = true, -- highlight the current line
  expandtab = true, -- convert tabs to spaces
  foldlevelstart = 20,
  foldmethod = "indent",
  icm = "split",
  laststatus = 3, -- Universal status bar
  lbr = true,
  mouse = "niv", -- allow the mouse to be used in neovim
  number = true, -- set numbered lines
  relativenumber = true, -- set relative numbered lines
  scrolloff = 12, -- number of lines above and below cursor when scrolling
  scrollback = 100000,
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  showmode = false, -- we don't need to see things like -- INSERT -- anymore
  showtabline = 0, -- 0: never, 1: only if there are at least two tab pages, 2: always
  sidescrolloff = 8,
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  ignorecase = false, -- ignore case in search patterns
  incsearch = true, -- set incremental search, like modern browsers
  smartcase = true, -- smart case
  smartindent = true, -- make indenting smarter again
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  swapfile = false, -- creates a swapfile
  synmaxcol = 500,
  tabstop = 2, -- insert 2 spaces for a tab
  termguicolors = true, -- set term gui colors (most terminals support this)
  timeoutlen = 200, -- time to wait for a mapped sequence to complete (in milliseconds)
  ttimeoutlen = 200,
  undofile = true, -- enable persistent undo
  updatetime = 100, -- faster completion (4000ms default)
  wrap = true, -- display lines as one long line
  writebackup = false, -- if a file is being edited by another program
  numberwidth = 5, -- set number column width to 4
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.opt.shortmess:append("acsI") -- disable nvim intro
vim.opt.whichwrap:append("<>[]hl") -- go to previous/next line with h,l

vim.opt.path:remove("/usr/include") -- Better search
vim.opt.path:append("**") -- Better search

vim.opt.wildignorecase = true
vim.opt.wildignore:append("**/node_modules/*")
vim.opt.wildignore:append("**/.git/*")

vim.opt.fixendofline = false -- Prevent Nvim from removing end of file new line

vim.g.editorconfig = false
vim.g.ruby_host_prog = "/Users/paul/.asdf/shims/neovim-ruby-host" -- avoid needing to install this in every project

vim.g.indentLine_color_gui = require("config.colors").colors.grey14

-- Custom fold text
vim.cmd([[
  function! MyFoldText()
    let line = getline(v:foldstart)
    let foldedlinecount = v:foldend - v:foldstart + 1

    return ' + ' . foldedlinecount . ' --- ' . line
  endfunction

  set foldtext=MyFoldText()
  set fillchars=fold:-
]])

-- Ensure I dont freak out by hitting the cap w when exiting
vim.cmd([[
  cnoreabbrev W! w!
  cnoreabbrev W1 w!
  cnoreabbrev w1 w!
  cnoreabbrev Q! q!
  cnoreabbrev Q1 q!
  cnoreabbrev q1 q!
  cnoreabbrev Qa! qa!
  cnoreabbrev Qall! qall!
  cnoreabbrev Wa wa
  cnoreabbrev Wq wq
  cnoreabbrev wQ wq
  cnoreabbrev WQ wq
  cnoreabbrev wq1 wq!
  cnoreabbrev Wq1 wq!
  cnoreabbrev wQ1 wq!
  cnoreabbrev WQ1 wq!
  cnoreabbrev W w
  cnoreabbrev Q q
  cnoreabbrev Qa qa
  cnoreabbrev Qall qall
]])
