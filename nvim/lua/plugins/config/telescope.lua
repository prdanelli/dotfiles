local status_ok, telescope = pcall(require, "telescope")
if not status_ok then return end

local actions = require("telescope.actions")
local previewers = require("telescope.previewers")
local sorters = require("telescope.sorters")

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

telescope.setup({
  pickers = {
    buffers = {
      show_all_buffers = true,
      sort_lastused = true,
      theme = "dropdown",
      previewer = false,
      mappings = {
        i = {
          ["<c-d>"] = "delete_buffer",
        }
      }
    }
  },
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-u>"] = false
      },
      n = {},
    },
    vimgrep_arguments = {
      "rg",
      "--vimgrep",
      "--hidden",
      "--smart-case",
      "--trim",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
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
        width = 0.999999,
        height = 0.999999,
      },
      vertical = {
        mirror = false,
        width = 0.9999999,
        height = 0.999999,
      },
    },
    file_sorter = sorters.get_fuzzy_file,
    file_ignore_patterns = { "gtk/**/*", "node_modules", ".git", "pdf_viewer" },
    generic_sorter = sorters.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    use_less = true,
    path_display = {},
    file_previewer = previewers.vim_buffer_cat.new,
    grep_previewer = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new,
    extensions = {}
  }
})