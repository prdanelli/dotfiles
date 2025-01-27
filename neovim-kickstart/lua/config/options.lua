local opt = vim.opt
local g = vim.g

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- LazyVim root dir detection
-- Each entry can be:
-- * the name of a detector function like `lsp` or `cwd`
-- * a pattern or array of patterns like `.git` or `lua`.
-- * a function with signature `function(buf) -> string|string[]`
g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }

-- Show the current document symbols location from Trouble in lualine
g.trouble_lualine = true -- You can disable this for a buffer by setting `vim.b.trouble_lualine = false`
g.snacks_animate = false
g.editorconfig = false
g.ruby_host_prog = "/Users/paul/.asdf/shims/neovim-ruby-host" -- avoid needing to install this in every project
g.have_nerd_font = true -- Set to true if you have a Nerd Font installed and selected in the terminal
g.markdown_recommended_style = 0 -- Fix markdown indentation settings
g.autoformat = true -- LazyVim auto format

opt.autowrite = true -- Enable auto write
-- only set clipboard if not in ssh, to make sure the OSC 52
-- integration works automatically. Requires Neovim >= 0.10.0
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
opt.completeopt = "menu,menuone,noselect"
-- opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
opt.conceallevel = 0 -- so that `` is visible in markdown files
opt.confirm = false -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.expandtab = true -- Use spaces instead of tabs
opt.fillchars = { foldopen = "", foldclose = "", fold = " ", foldsep = " ", diff = "╱", eob = " " }
opt.foldlevel = 99
opt.formatexpr = "v:lua.require'lazyvim.util'.format.formatexpr()"
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true -- Ignore case
opt.inccommand = "nosplit" -- preview incremental substitute
opt.jumpoptions = "view"
opt.laststatus = 3 -- global statusline
opt.linebreak = true -- Wrap lines at convenient points
opt.wrap = true
opt.list = true -- Show some invisible characters (tabs...
opt.mouse = "a" -- Enable mouse mode
opt.number = true -- Print line number
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.relativenumber = true -- Relative line numbers
opt.ruler = false -- Disable the default ruler
opt.scrolloff = 4 -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.showmode = false -- Dont show mode since we have a statusline
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.spelllang = { "en" }
opt.splitbelow = true -- Put new windows below current
opt.splitkeep = "screen"
opt.splitright = true -- Put new windows right of current
opt.statuscolumn = [[%!v:lua.require'snacks.statuscolumn'.get()]]
opt.tabstop = 2 -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.timeoutlen = 300 -- Lower than default (1000) to quickly trigger which-key
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.wrap = true -- Disable line wrap
opt.smoothscroll = true
opt.foldexpr = "v:lua.require'lazyvim.util'.ui.foldexpr()"
opt.foldmethod = "expr"
opt.foldtext = ""
opt.backup = false -- creates a backup file
opt.iskeyword:append({ "_", "-" })
opt.whichwrap:append "<>[]hl" -- go to previous/next line with h,l
opt.cmdheight = 1 -- 0 = off, more space in the neovim command line for displaying messages
opt.colorcolumn = "80,120"
opt.fixendofline = false -- Prevent Nvim from removing end of file new line
opt.showtabline = 0 -- 0: never, 1: only if there are at least two tab pages, 2: always
opt.swapfile = false
opt.writebackup = false -- if a file is being edited by another program
opt.mousescroll = "ver:1,hor:0"
opt.breakindent = true -- Enable break indent
opt.list = true -- Sets how neovim will display certain whitespace characters in the editor. See `:help 'list'` and `:help 'listchars'`
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Ensure I dont freak out by hitting the cap w when exiting
vim.cmd [[
  cnoreabbrev Wq wq
  cnoreabbrev wQ wq
  cnoreabbrev WQ wq
  cnoreabbrev W w
  cnoreabbrev Q q
]]
