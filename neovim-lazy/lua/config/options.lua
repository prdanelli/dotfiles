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
  timeoutlen = 200, -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true, -- enable persistent undo
  wrap = true,
  writebackup = false, -- if a file is being edited by another program
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.g.editorconfig = false
vim.opt.whichwrap:append("<>[]hl") -- go to previous/next line with h,l
vim.g.ruby_host_prog = "/Users/paul/.asdf/shims/neovim-ruby-host" -- avoid needing to install this in every project

-- Ensure I dont freak out by hitting the cap w when exiting
vim.cmd([[
  cnoreabbrev Wq wq
  cnoreabbrev wQ wq
  cnoreabbrev WQ wq
  cnoreabbrev W w
  cnoreabbrev Q q
]])

vim.opt.foldlevel = 1

function _G.custom_fold_text()
  local line = vim.fn.getline(vim.v.foldstart)
  local line_count = vim.v.foldend - vim.v.foldstart + 1

  return " --- " .. line_count .. " lines: " .. line
end

vim.opt.foldtext = "v:lua.custom_fold_text()"
