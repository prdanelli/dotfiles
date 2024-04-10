-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Editing --
vim.api.nvim_create_augroup("_editing", { clear = true })

-- Enable spell check and word wrap for certain file types
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = "_editing",
  pattern = { "gitcommit", "markdown", "txt" },
  desc = "Enable spell checking and text wrapping for certain filetypes",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Prevent IndentLine from hiding ``` in markdown files
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = "_editing",
  pattern = { "markdown" },
  callback = function()
    vim.g["indentLine_enabled"] = 0
    vim.g["markdown_syntax_conceal"] = 0
  end,
})

-- Formatting --
vim.api.nvim_create_augroup("_formatting", { clear = true })

-- Adjust how text is formatted
vim.api.nvim_create_autocmd("BufWinEnter", {
  group = "_formatting",
  pattern = "*",
  callback = function()
    vim.cmd("set formatoptions-=cro")
  end,
})

-- Misc --
vim.api.nvim_create_augroup("_general", { clear = true })

-- Close different buffers with `q`
vim.api.nvim_create_autocmd("FileType", {
  group = "_general",
  pattern = "qf,help,man,lspinfo,startuptime,neotest-summary",
  callback = function()
    vim.cmd("nnoremap <silent><buffer> q :close<cr>")
  end,
})

-- Don't list quick list in buffer list and so bnext etc dont toggle to it
vim.api.nvim_create_autocmd("FileType", {
  group = "_general",
  pattern = "qf",
  callback = function()
    vim.cmd("set nobuflisted")
  end,
})

-- Run resize methods when window size is changes
vim.api.nvim_create_autocmd("VimResized", {
  group = "_general",
  pattern = "*",
  callback = function()
    local current_tab = vim.fn.tabpagenr()

    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = "_general",
  callback = function(event)
    if event.match:match("^%w%w+://") then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- Git --
vim.api.nvim_create_augroup("_git", { clear = true })

-- Enable spell check and word wrap for git commits
vim.api.nvim_create_autocmd("FileType", {
  group = "_git",
  pattern = "gitcommit",
  callback = function()
    vim.cmd("setlocal spell")
    vim.cmd("setlocal wrap")
  end,
})

-- Lazy --
local lazy_loaded, _ = pcall(require, "lazy")
if not lazy_loaded then
  return
end

vim.api.nvim_create_augroup("_lazy", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = "_lazy",
  pattern = "lazy",
  callback = function()
    vim.cmd("setlocal nonumber colorcolumn= | autocmd BufUnload set colorcolumn=80,120")
  end,
})

local colorizer_loaded, _ = pcall(require, "colorizer")
if colorizer_loaded then
  vim.api.nvim_create_autocmd("FileType", {
    group = "_lazy",
    pattern = "lazy",
    callback = function()
      vim.cmd("ColorizerDetachFromBuffer")
    end,
  })
end

-- Ruby --
vim.api.nvim_create_augroup("_ruby", { clear = true })

-- Set Active Admin .arb files to be ruby files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = "_ruby",
  pattern = "*.html.arb,*.html.slim",
  callback = function()
    vim.cmd("setfiletype ruby")
  end,
})

-- SHKD --
vim.api.nvim_create_augroup("_skhd", { clear = true })

-- Set Active Admin .arb files to be ruby files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = "_skhd",
  pattern = "skhdrc",
  callback = function()
    vim.cmd("setfiletype bash")
  end,
})
