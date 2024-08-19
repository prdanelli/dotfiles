return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  config = function()
    local actions = require("telescope.actions")
    local previewers = require("telescope.previewers")
    local sorters = require("telescope.sorters")

    require("telescope").load_extension("grapple")

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

    local width = 0.95
    local height = 0.95

    require("telescope").setup({
      pickers = {
        buffers = {
          show_all_buffers = true,
          -- sort_lastused = true,
          sort_mru = true,
          previewer = false,
          theme = "dropdown",
          mappings = {
            i = {
              ["<c-d>"] = "delete_buffer",
            },
          },
        },
      },
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = actions.close,
            ["<C-u>"] = false,
            ["<C-j>"] = require("telescope.actions").cycle_history_next,
            ["<C-k>"] = require("telescope.actions").cycle_history_prev,
            ["<C-n>"] = require("telescope.actions").move_selection_next,
            ["<C-p>"] = require("telescope.actions").move_selection_previous,
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
            width = width,
            height = height,
          },
          vertical = {
            mirror = false,
            width = width,
            height = height,
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
        extensions = {},
      },
    })
  end,
}
