local options = {
  backup = false, -- creates a backup file
  breakindent = true, -- Enable break indent
  clipboard = 'unnamedplus', -- allows neovim to access the system clipboard
  cmdheight = 1, -- 0 = off, more space in the neovim command line for displaying messages
  colorcolumn = '80,120',
  conceallevel = 0, -- so that `` is visible in markdown files
  confirm = false,
  cursorline = true, -- Show which line your cursor is on
  fixendofline = false, -- Prevent Nvim from removing end of file new line
  foldmethod = 'indent',
  foldtext = "v:lua.require'lazyvim.util'.ui.foldtext()",
  ignorecase = true, -- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
  list = true, -- Sets how neovim will display certain whitespace characters in the editor. See `:help 'list'` and `:help 'listchars'`
  listchars = { tab = '» ', trail = '·', nbsp = '␣' },
  number = true, -- set numbered lines
  relativenumber = true, -- set relative numbered lines
  scrolloff = 10, -- Minimal number of screen lines to keep above and below the cursor.
  showmode = false, -- Don't show the mode, since it's already in the status line
  showtabline = 0, -- 0: never, 1: only if there are at least two tab pages, 2: always
  signcolumn = 'yes', -- always show the sign column, otherwise it would shift the text each time
  smartcase = true,
  splitbelow = true,
  splitright = true, -- force all vertical splits to go to the right of current window
  swapfile = false,
  termguicolors = true,
  timeoutlen = 200, -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true, -- enable persistent undo
  updatetime = 250, -- Decrease update time
  wrap = true,
  writebackup = false, -- if a file is being edited by another program
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.g.snacks_animate = false
vim.g.editorconfig = false
vim.g.ruby_host_prog = '/Users/paul/.asdf/shims/neovim-ruby-host' -- avoid needing to install this in every project
vim.g.have_nerd_font = true -- Set to true if you have a Nerd Font installed and selected in the terminal
vim.opt.whichwrap:append '<>[]hl' -- go to previous/next line with h,l

-- Ensure I dont freak out by hitting the cap w when exiting
vim.cmd [[
  cnoreabbrev Wq wq
  cnoreabbrev wQ wq
  cnoreabbrev WQ wq
  cnoreabbrev W w
  cnoreabbrev Q q
]]

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)
