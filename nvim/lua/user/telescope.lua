local trouble = require("trouble.providers.telescope")
local actions = require("telescope.actions")
local telescope = require("telescope")

telescope.load_extension("file_browser", { grouped = true })
telescope.load_extension("fzf") -- require fzf extension for better fzf sorting algorithm

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
				["<c-t>"] = trouble.open_with_trouble,
      },
			n = {
				["<c-t>"] = trouble.open_with_trouble
			},
    },
    vimgrep_arguments = {
      "rg",
      "--vimgrep",
      "--hidden",
      "--smart-case",
      "--trim"
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
      prompt_position = "top",
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = { "gtk/**/*", "node_modules", ".git", "pdf_viewer" },
    generic_sorter =  require("telescope.sorters").get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    use_less = true,
    path_display = {},
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    extensions = {
      fzf = {
        override_generic_sorter = false,
        override_file_sorter = true,
        case_mode = "smart_case"
      },
			file_browser = {
				files = false,
			}
    }
  }
})

local opts = { silent = true }

vim.keymap.set("n", "<leader>p", "<cmd>Telescope find_files hidden=true layout_config={'prompt_position':'top'}<cr>", opts)
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<cr>", opts)
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope registers<cr>", opts)
vim.keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", opts)

-- LSP funtions
vim.keymap.set("n", "<leader>ls", "<cmd>lsp_document_symbols<cr>", opts)
vim.keymap.set("n", "<leader>la", "<cmd>lsp_code_actions<cr>", opts)
vim.keymap.set("n", "<leader>ld", "<cmd>lsp_definitions<cr>", opts)

-- Git functions
vim.keymap.set("n", "<leader>gc", "<cmd>git_commits<cr>", opts)
vim.keymap.set("n", "<leader>gs", "<cmd>git_status<cr>", opts)
vim.keymap.set("n", "<leader>gt", "<cmd>git_stash<cr>", opts)

-- Filemanager shortcuts
-- <A-c>/c	Create file/folder at current path (trailing path separator creates folder)
-- <A-r>/r	Rename multi-selected files/folders
-- <A-m>/m	Move multi-selected files/folders to current path
-- <A-y>/y	Copy (multi-)selected files/folders to current path
-- <A-d>/d	Delete (multi-)selected files/folders
-- <C-o>/o	Open file/folder with default system application
-- <C-g>/g	Go to parent directory
-- <C-e>/e	Go to home directory
-- <C-w>/w	Go to current working directory (cwd)
-- <C-t>/t	Change nvim's cwd to selected folder/file(parent)
-- <C-f>/f	Toggle between file and folder browser
-- <C-h>/h	Toggle hidden files/folders
-- <C-s>/s	Toggle all entries ignoring ./ and ../
vim.keymap.set("n", "<leader>ff", ":Telescope file_browser grouped=true<cr>", { silent = true })

