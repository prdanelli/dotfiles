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
    prompt_prefix = " ",
    selection_caret = " ",
    entry_prefix = "  ",
    set_env = { ["COLORTERM"] = "truecolor" },
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

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- File/vim functions
keymap("n", "<leader>p", "<cmd>Telescope find_files hidden=true layout_config={'prompt_position':'top'}<cr>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<cr>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
keymap("n", "<leader>fr", "<cmd>Telescope registers<cr>", opts)
keymap("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", opts)

-- LSP funtions
keymap("n", "<leader>ls", "<cmd>lsp_document_symbols<cr>", opts)
keymap("n", "<leader>la", "<cmd>lsp_code_actions<cr>", opts)
keymap("n", "<leader>ld", "<cmd>lsp_definitions<cr>", opts)

-- Git functions
keymap("n", "<leader>gc", "<cmd>git_commits<cr>", opts)
keymap("n", "<leader>gs", "<cmd>git_status<cr>", opts)
keymap("n", "<leader>gt", "<cmd>git_stash<cr>", opts)

