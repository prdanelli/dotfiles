local options = {
  background = "dark",
  backup = false, -- creates a backup file
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  cmdheight = 1, -- more space in the neovim command line for displaying messages
  colorcolumn = "80,120",
  completeopt = { "menu", "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0, -- so that `` is visible in markdown files
  cursorline = true, -- highlight the current line
  expandtab = true, -- convert tabs to spaces
  fileencoding = "utf-8", -- the encoding written to a file
  foldmethod = "indent",
  foldlevelstart = 20,
  guifont = "monospace:h17", -- the font used in graphical neovim applications
  hlsearch = true, -- highlight all matches on previous search pattern
  ignorecase = true, -- ignore case in search patterns
  lbr = true,
  mouse = "niv", -- allow the mouse to be used in neovim
  number = true, -- set numbered lines
  numberwidth = 4, -- set number column width to 2 {default 4}
  pumheight = 10, -- pop up menu height
  relativenumber = true, -- set relative numbered lines
  scrolloff = 8, -- is one of my fav
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  showmode = false, -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2, -- always show tabs
  sidescrolloff = 8,
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  smartcase = true, -- smart case
  smartindent = true, -- make indenting smarter again
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  swapfile = false, -- creates a swapfile
  synmaxcol = 500,
  tabstop = 2, -- insert 2 spaces for a tab
  termguicolors = true, -- set term gui colors (most terminals support this)
  timeoutlen = 250, -- time to wait for a mapped sequence to complete (in milliseconds)
  ttimeoutlen = 250,
  updatetime = 100, -- faster completion (4000ms default)
  undofile = true, -- enable persistent undo
  wrap = true, -- display lines as one long line
  writebackup = false, -- if a file is being edited by another program
  laststatus = 3, -- Universal status bar
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"

-- Custom fold text
vim.cmd [[
function! MyFoldText()
let line = getline(v:foldstart)
let foldedlinecount = v:foldend - v:foldstart + 1

return ' + ' . foldedlinecount . ' --- ' . line
endfunction

set foldtext=MyFoldText()
set fillchars=fold:-
]]

vim.api.nvim_command([[ autocmd BufRead,BufNewFile *.arb setfiletype ruby ]])

-- Highlight yanked
-- vim.g["highlightedyank_highlight_duration"] = 250
-- vim.cmd [[highlight HighlightedyankRegion cterm=reverse gui=reverse]]

