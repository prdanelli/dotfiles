" right-sep 
" left-sep 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nvim Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:python_host_prog  = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'
let g:ruby_host_prog = '/home/paul/.rvm/rubies/ruby-2.7.3/bin/ruby'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set ttyfast
set encoding=UTF-8
set fileencoding=utf-8
syntax on
filetype on
filetype indent on
filetype plugin on
set regexpengine=1
set synmaxcol=200
set updatetime=300
set timeoutlen=500
set shell=bash
set ruler
set hidden " Enable Hidden Buffers - means you can switch between buffers without saving
set clipboard+=unnamedplus " Use System Clipboard

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Look / Colours
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set termguicolors
set background=dark
set colorcolumn=80,120 " Character line limits
set cursorline " Highlight the current line
set laststatus=2 " Show status line always
set conceallevel=0
set expandtab " On pressing tab, insert 2 spaces
set tabstop=2 " show existing tab with 2 spaces width
set softtabstop=2
set shiftwidth=2 " when indenting with '>', use 2 spaces width
set noshowmode " Don't show -- INSERT--
set path+=** " Search recurively
set wildmenu " Menu autocomplete
set wildmode=longest:full,full
set backspace=indent,eol,start " How should backspace be used
set mouse=niv " Enable mouse selection
set linebreak " Word wrap but don't cut words
set wrap
set smartindent " Indentation
set autoindent
set shortmess+=c " Don't pass messages to |ins-completion-menu|.
set number " Turn line numbers on by default
set relativenumber " Set relative numbers
set signcolumn=yes " Always show gutter so Gitgutter doesn't jump
set numberwidth=3 " Line number width
set hlsearch " Highlight search terms
set incsearch " Highlight terms as search is typed
set nobackup
set nowritebackup

" Swap / Persistent directories
set swapfile
set backupdir=.backup/,~/.vim/.backup,/tmp/
set directory=.swp/,~/.vim/.vim/.swapfiles/,/tmp/
set undodir=.undo/,~/.vim/.undo/,/tmp/
set undofile

" Set universal ignore
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor/**/*,*/.cache,*/node_modules/**/*,*/docker/**/*

" Highlight Yank
let g:highlightedyank_highlight_duration = 250
highlight HighlightedyankRegion cterm=reverse gui=reverse

" Treat .es6 as .js
au BufNewFile,BufRead *.es6 set filetype=javascript
au BufNewFile,BufRead *.rasi set filetype=css

" Code folding
set nofoldenable
set foldmethod=indent

" Keep all folds open when a file is opened
augroup OpenAllFoldsOnFileOpen
	autocmd!
	autocmd BufRead * normal zR
augroup END

" Change the default fold lines
function! MyFoldText()
		let line = getline(v:foldstart)
		let foldedlinecount = v:foldend - v:foldstart + 1
		return ' + '. foldedlinecount . line
endfunction
set foldtext=MyFoldText()
set fillchars=fold:-

" Vim Sneak
let g:sneak#label = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rnvimr
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make Ranger replace netrw and be the file explorer
let g:rnvimr_ex_enable = 1
" Make Ranger to be hidden after picking a file
let g:rnvimr_enable_picker = 1
" Border for floating window
let g:rnvimr_draw_border = 1
" Hide the files included in gitignore
let g:rnvimr_hide_gitignore = 1
" Change the border's color
let g:rnvimr_border_attr = {'fg': 14, 'bg': -1}
" Make Neovim wipe the buffers corresponding to the files deleted by Ranger
let g:rnvimr_enable_bw = 1
" Add a shadow window, value is equal to 100 will disable shadow
let g:rnvimr_shadow_winblend = 70
" Draw border with both
let g:rnvimr_ranger_cmd = 'ranger --cmd="set draw_borders both"'
" Link CursorLine into RnvimrNormal highlight in the Floating window
highlight link RnvimrNormal CursorLine

let g:rnvimr_ranger_views = [
	\ {'minwidth': 90, 'ratio': []},
	\ {'minwidth': 90, 'maxwidth': 89, 'ratio': [1,1]},
	\ {'maxwidth': 90, 'ratio': [1]}
\ ]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set colorscheme nightfox
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
local nightfox = require('nightfox')

nightfox.setup({
	fox = "nordfox", -- change the colorscheme to use nordfox
	styles = {
		comments = "italic", -- change style of comments to be italic
		keywords = "bold", -- change style of keywords to be bold
		functions = "italic,bold" -- styles can be a comma separated list
	},
	colors = {
		red = "#FF000", -- Override the red color for MAX POWER
		bg_alt = "#000000",
	},
	hlgroups = {
		TSPunctDelimiter = { fg = "#BF616A" }, -- Override a highlight group with the color red
		LspCodeLens = { bg = "#000000", style = "italic" },
	}
})

nightfox.load()
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tree Sitter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
require'nvim-treesitter.configs'.setup({
  ensure_installed = { "ruby", "javascript", "html", "css", "lua", "dockerfile", "bash", "yaml" },
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false
	},
  indent = {
    enable = false
  },
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = { "BufWrite", "CursorHold" }
  },
})
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bufferline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
require('bufferline').setup {
	options = {
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = false,
		show_buffer_icons = false,
		show_tab_indicators = true,
		separator_style = "thin"
	}
}
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:fzf_tags_command = 'ctags -R'
let g:fzf_layout = { 'up' :'~90%', 'window': { 'width': 0.95, 'height': 0.9 } }
let g:fzf_colors = {
	\ 'fg':      ['fg', 'Normal'],
	\ 'bg':      ['bg', 'Normal'],
	\ 'hl':      ['fg', 'Comment'],
	\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
	\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
	\ 'hl+':     ['fg', 'Statement'],
	\ 'info':    ['fg', 'PreProc'],
	\ 'border':  ['fg', 'Boolean'],
	\ 'prompt':  ['fg', 'Conditional'],
	\ 'pointer': ['fg', 'Exception'],
	\ 'marker':  ['fg', 'Keyword'],
	\ 'spinner': ['fg', 'Label'],
	\ 'header':  ['fg', 'Comment'] }
let $FZF_DEFAULT_OPTS = '--layout=reverse --inline-info'
let $FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/**'"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Startify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:startify_custom_header =[]
let g:startify_change_to_dir=0
function! s:gitModified()
	let files = systemlist('git ls-files -m 2>/dev/null')
	return map(files, "{'line': v:val, 'path': v:val}")
endfunction
let g:startify_bookmarks = ['~/.config/nvim/config.vim', '~/.config/nvim/plugins.vim', '~/.config/nvim/keymap.vim']
let g:startify_enable_special = 0
let g:startify_lists = [
	\ { 'type': 'bookmarks', 'header': ['   Bookmarks'] },
	\ { 'type': 'files',     'header': ['   Recent'] },
	\ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
	\ { 'type': 'sessions',  'header': ['   Sessions'] },
	\ { 'type': function('s:gitModified'),  'header': ['   Modified'] },
	\ { 'type': 'commands',  'header': ['   Commands'] },
	\ ]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lualine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
require'lualine'.setup({
	options = {
		icons_enabled = true,
		theme = 'auto',
		component_separators = { left = '\\', right = '/' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = {}
		},
	sections = {
		lualine_a = { { 'mode' } },
		lualine_b = { 'branch' },
		lualine_c = { require'lsp-status'.status },
		lualine_x = { 'filename', 'encoding', 'filetype' },
		lualine_y = { 'progress' },
		lualine_z = { 'location' }
		},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = { 'location' },
		lualine_y = {},
		lualine_z = {}
		},
	tabline = {},
	extensions = {}
})
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Telescope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
require('telescope').setup({
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = require('telescope.actions').close,
      },
    },
    vimgrep_arguments = {
      'rg',
      '--vimgrep',
      '--hidden',
      '--smart-case',
      '--trim'
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      prompt_position = 'top',
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require('telescope.sorters').get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require('telescope.sorters').get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    extensions = {
      fzf = {
        override_generic_sorter = false,
        override_file_sorter = true,
        case_mode = "smart_case"
      }
    }
  }
})

-- require fzf extension for better fzf sorting algorithm
require('telescope').load_extension('fzf')
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LSP Install
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <c-x> <c-o> -	Complete
" gd - Jump to definition
" K  - Show hover documentation
" gt - Open quickfix with all references to method
" rn - Rename method and update references
lua << EOF
local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gK', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gt', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end

  -- print(vim.inspect(client))
  print("Attached to " .. client.name)
end

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.documentationFormat = { 'markdown', 'plaintext' }
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = { 'documentation', 'detail', 'additionalTextEdits' }
}
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local handlers = {
  ["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = true
    }
  )
}

require('lspinstall').setup()
local servers = require('lspinstall').installed_servers()
for _, server in pairs(servers) do
  nvim_lsp[server].setup {
    on_attach = on_attach,
    flags = { debounce_text_changes = 150 },
    capabilities = capabilities,
    root_dir = nvim_lsp.util.root_pattern(".git", "."),
    handlers = handlers
  }
end

nvim_lsp.solargraph.setup {
  cmd = { "solargraph", "stdio" },
  filetypes = { "ruby" },
  flags = { debounce_text_changes = 150 },
  on_attach = on_attach,
  root_dir = nvim_lsp.util.root_pattern("Gemfile", ".git", "."),
  capabilities = capabilities,
  handlers = handlers,
  settings = {
    solargraph = {
			formatting = false,
      autoformat = false,
      completion = true,
      diagnostic = true,
      folding = true,
      references = true,
      rename = true,
      symbols = true
    }
  }
}
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CMP Completion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
local luasnip = require('luasnip')
local nvim_lsp = require('lspconfig')

local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
      elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
      elseif luasnip.jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lsp Trouble
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
  require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lazy Git
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 0.9 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_floating_window_use_plenary = 0 " use plenary.nvim to manage floating window if available
let g:lazygit_use_neovim_remote = 1 " fallback to 0 if neovim-remote is not installed

