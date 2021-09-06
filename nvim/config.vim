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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Look / Colours
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set termguicolors
set background=dark

" Character line limits
set colorcolumn=80,120

" Highlight the current line
set cursorline

" Show status line always
set laststatus=2

" Treat .es6 as .js
au BufNewFile,BufRead *.es6 set filetype=javascript
au BufNewFile,BufRead *.rasi set filetype=css

" Code folding
set nofoldenable
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set fillchars=fold:-

" Keep all folds open when a file is opened
augroup OpenAllFoldsOnFileOpen
	autocmd!
	autocmd BufRead * normal zR
augroup END

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
" LSP Install
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
  require("trouble").setup {}

  local saga = require 'lspsaga'
  saga.init_lsp_saga()
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LuaLine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
  require'lualine'.setup({
   options = {
    lower = true,
    icons_enabled = true,
    theme = 'auto',
    component_separators = { '\\', '/' },
    section_separators = { '', '' },
    disabled_filetypes = {}
   },
   sections = {
    lualine_a = { { 'mode', lower = false } },
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

lua << EOF
	require('telescope').setup{
		defaults = {
			vimgrep_arguments = {
				'rg',
				'--color=never',
				'--no-heading',
				'--with-filename',
				'--line-number',
				'--column',
				'--smart-case'
			},
			prompt_prefix = "> ",
			selection_caret = "> ",
			entry_prefix = "  ",
			initial_mode = "insert",
			selection_strategy = "reset",
			sorting_strategy = "descending",
			layout_strategy = "horizontal",
			layout_config = {
				horizontal = {
					mirror = false,
				},
				vertical = {
					mirror = false,
				},
			},
			file_sorter =  require'telescope.sorters'.get_fuzzy_file,
			file_ignore_patterns = {},
			generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
			winblend = 0,
			border = {},
			borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
			color_devicons = true,
			use_less = true,
			path_display = {},
			set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
			file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
			grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
			qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

			-- Developer configurations: Not meant for general override
			buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
		}
	}
EOF
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Behaviour
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set conceallevel=0

" Tab / space behaviour
set tabstop=2
set smarttab
set expandtab

" Don't show -- INSERT--
set noshowmode

" Search recurively
set path+=**

" Menu autocomplete
set wildmenu
set wildmode=longest:full,full

" How should backspace be used
set backspace=indent,eol,start

" Enable mouse selection
set mouse=niv

" Word wrap but don't cut words
set linebreak
set wrap

" Enable Hidden Buffers - means you can switch between buffers without saving
set hidden

" Use System Clipboard
set clipboard=unnamedplus

" Indentation
set smartindent
set autoindent

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Turn line numbers on by default, and set relative
set number
set relativenumber

 " Always show gutter so Gitgutter doesn't jump
set signcolumn=yes

" Line number width
set numberwidth=3

" Highlight search terms
set hlsearch

" Highlight terms as search is typed
set incsearch
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tree Sitter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
	require'nvim-treesitter.configs'.setup({
		ensure_installed = "maintained",
		ignore_install = {},
		highlight = {
			enable = true,
			disable = { "c", "rust" },
			additional_vim_regex_highlighting = true,
		}
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
" LSP Install
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
	require'lspinstall'.setup() -- important

	local function setup_servers()
		require'lspinstall'.setup()
		local servers = require'lspinstall'.installed_servers()
		for _, server in pairs(servers) do
			require'lspconfig'[server].setup{}
		end
	end

	setup_servers()

	-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
	require'lspinstall'.post_install_hook = function ()
		setup_servers() -- reload installed servers
		vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
	end
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Sneak
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:sneak#label = 1

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

" Highlight Yank
let g:highlightedyank_highlight_duration = 250
highlight HighlightedyankRegion cterm=reverse gui=reverse

