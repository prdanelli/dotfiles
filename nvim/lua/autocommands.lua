vim.api.nvim_command([[
  autocmd BufRead,BufNewFile *.arb setfiletype ruby
]])

vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Search', timeout = 200})
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd =
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end
]]

local opts = { clear = true }
vim.api.nvim_create_augroup("_bufcheck", opts)

-- start git messages in insert mode
-- vim.api.nvim_create_autocmd('FileType', {
--   group    = '_bufcheck',
--   pattern  = { 'gitcommit', 'gitrebase', },
--   command  = 'startinsert | 1'
-- })

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd('BufReadPost', {
  group    = '_bufcheck',
  pattern  = '*',
  callback = function()
    if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
      vim.fn.setpos('.', vim.fn.getpos("'\""))
      -- vim.cmd('normal zz') -- how do I center the buffer in a sane way??
      vim.cmd('silent! foldopen')
    end
  end
})

-- Extending/overriding a colorscheme.
vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = 'onedark',
  desc = 'extend / override onedark',
  callback = function()
    local h = function(...) vim.api.nvim_set_hl(0, ...) end

    h('String', { fg = '#FFEB95' })
    h('TelescopeMatching', { link = 'Boolean' })
  end
})

-- Strip trailing whitespaces on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = "%s/\\s\\+$//e"
})

-- Enable spell checking for certain file types
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.txt", "*.md", "*.tex" },
  command = "setlocal spell"
})

