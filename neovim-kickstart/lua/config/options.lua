vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Show the current document symbols location from Trouble in lualine
vim.g.trouble_lualine = true -- You can disable this for a buffer by setting `vim.b.trouble_lualine = false`
vim.g.snacks_animate = false
vim.g.editorconfig = false
vim.g.ruby_host_prog = "/Users/paul/.asdf/shims/neovim-ruby-host" -- avoid needing to install this in every project
vim.g.have_nerd_font = true -- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.markdown_recommended_style = 0 -- Fix markdown indentation settings

vim.opt.autowrite = true -- Enable auto write
-- only set clipboard if not in ssh, to make sure the OSC 52
-- integration works automatically. Requires Neovim >= 0.10.0
vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
vim.opt.completeopt = "menu,menuone,noselect"
-- vim.opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.confirm = false -- Confirm to save changes before exiting modified buffer
vim.opt.cursorline = true -- Enable highlighting of the current line
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.fillchars = { foldopen = "", foldclose = "", fold = " ", foldsep = " ", diff = "╱", eob = " " }
vim.opt.foldlevel = 99
vim.opt.formatexpr = "v:lua.require'lazyvim.util'.format.formatexpr()"
vim.opt.formatoptions = "jcroqlnt" -- tcqj
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"
vim.opt.ignorecase = true -- Ignore case
vim.opt.inccommand = "nosplit" -- preview incremental substitute
vim.opt.jumpoptions = "view"
vim.opt.laststatus = 3 -- global statusline
vim.opt.linebreak = true -- Wrap lines at convenient points
vim.opt.wrap = true
vim.opt.list = true -- Show some invisible characters (tabs...
vim.opt.mouse = "a" -- Enable mouse mode
vim.opt.number = true -- Print line number
vim.opt.pumblend = 10 -- Popup blend
vim.opt.pumheight = 10 -- Maximum number of entries in a popup
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.ruler = false -- Disable the default ruler
vim.opt.scrolloff = 4 -- Lines of context
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
vim.opt.shiftround = true -- Round indent
vim.opt.shiftwidth = 2 -- Size of an indent
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })
vim.opt.showmode = false -- Dont show mode since we have a statusline
vim.opt.sidescrolloff = 8 -- Columns of context
vim.opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
vim.opt.smartcase = true -- Don't ignore case with capitals
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.spelllang = { "en" }
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitkeep = "screen"
vim.opt.splitright = true -- Put new windows right of current
vim.opt.statuscolumn = [[%!v:lua.require'snacks.statuscolumn'.get()]]
vim.opt.tabstop = 2 -- Number of spaces tabs count for
vim.opt.termguicolors = true -- True color support
vim.opt.timeoutlen = 300 -- Lower than default (1000) to quickly trigger which-key
vim.opt.updatetime = 200 -- Save swap file and trigger CursorHold
vim.opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
vim.opt.wildmode = "longest:full,full" -- Command-line completion mode
vim.opt.winminwidth = 5 -- Minimum window width
vim.opt.wrap = true -- Disable line wrap
vim.opt.smoothscroll = true
vim.opt.foldexpr = "v:lua.require'lazyvim.util'.ui.foldexpr()"
vim.opt.foldmethod = "expr"
vim.opt.foldtext = ""
vim.opt.backup = false -- creates a backup file
vim.opt.iskeyword:append({ "_", "-" })
vim.opt.whichwrap:append "<>[]hl" -- go to previous/next line with h,l
vim.opt.cmdheight = 1 -- 0 = off, more space in the neovim command line for displaying messages
vim.opt.colorcolumn = "80,120"
vim.opt.fixendofline = false -- Prevent Nvim from removing end of file new line
vim.opt.showtabline = 0 -- 0: never, 1: only if there are at least two tab pages, 2: always
vim.opt.swapfile = false
vim.opt.writebackup = false -- if a file is being edited by another program
vim.opt.mousescroll = "ver:1,hor:0"
vim.opt.breakindent = true -- Enable break indent
vim.opt.list = true -- Sets how neovim will display certain whitespace characters in the editor. See `:help 'list'` and `:help 'listchars'`
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath "state" .. "/sessions/" -- directory where session files are saved
vim.opt.undolevels = 10000
vim.opt.diffopt = "filler,internal,closeoff,algorithm:histogram,context:5,linematch:60,algorithm:histogram"

-- Ensure I dont freak out by hitting the cap w when exiting
vim.cmd [[
  cnoreabbrev Wq wq
  cnoreabbrev wQ wq
  cnoreabbrev WQ wq
  cnoreabbrev W w
  cnoreabbrev Q q
]]
