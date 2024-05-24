return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  opts = function()
    local actions = require("telescope.actions")
    local previewers = require("telescope.previewers")
    local sorters = require("telescope.sorters")

    local open_with_trouble = function(...)
      return require("trouble.providers.telescope").open_with_trouble(...)
    end

    local open_selected_with_trouble = function(...)
      return require("trouble.providers.telescope").open_selected_with_trouble(...)
    end

    local find_files_no_ignore = function()
      local action_state = require("telescope.actions.state")
      local line = action_state.get_current_line()

      LazyVim.telescope("find_files", { no_ignore = true, default_text = line })()
    end

    local find_files_with_hidden = function()
      local action_state = require("telescope.actions.state")
      local line = action_state.get_current_line()

      LazyVim.telescope("find_files", { hidden = true, default_text = line })()
    end

    local select_one_or_multi = function(prompt_bufnr)
      local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
      local multi = picker:get_multi_selection()
      if not vim.tbl_isempty(multi) then
        require("telescope.actions").close(prompt_bufnr)
        for _, j in pairs(multi) do
          if j.path ~= nil then
            vim.cmd(string.format("%s %s", "edit", j.path))
          end
        end
      else
        require("telescope.actions").select_default(prompt_bufnr)
      end
    end

    require("telescope").load_extension("fzf")

    local width = 0.95
    local height = 0.95

    return {
      pickers = {
        buffers = {
          show_all_buffers = true,
          sort_lastused = true,
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
        prompt_prefix = " ",
        selection_caret = " ",
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
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--vimgrep",
          "--hidden",
          "--smart-case",
          "--trim",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
        },
        mappings = {
          i = {
            ["<esc>"] = actions.close,

            ["<c-t>"] = open_with_trouble,
            ["<c-y>"] = open_selected_with_trouble,
            ["<c-g>"] = find_files_no_ignore,
            ["<c-h>"] = find_files_with_hidden,

            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<c-w>"] = actions.send_selected_to_qflist + actions.open_qflist,

            ["<C-f>"] = actions.preview_scrolling_down,
            ["<C-b>"] = actions.preview_scrolling_up,
            ["<C-j>"] = actions.cycle_history_next,
            ["<C-k>"] = actions.cycle_history_prev,
            ["<C-n>"] = actions.move_selection_next,
            ["<C-p>"] = actions.move_selection_previous,

            ["<CR>"] = select_one_or_multi,
          },
          n = {
            ["q"] = actions.close,
          },
        },
        file_ignore_patterns = { "gtk/**/*", "node_modules", ".git", "pdf_viewer" },
        color_devicons = true,
        use_less = true,
        path_display = {},
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        file_previewer = previewers.vim_buffer_cat.new,
        grep_previewer = previewers.vim_buffer_vimgrep.new,
        qflist_previewer = previewers.vim_buffer_qflist.new,
        file_sorter = sorters.get_fuzzy_file,
        generic_sorter = sorters.get_generic_fuzzy_sorter,
        extensions = {},
      },
    }
  end,
  keys = function()
    return {
      { "<leader>fa", "<cmd>Telescope autocommands<cr>", desc = "Autocommands" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Commands" },
      { "<leader>fd", "<cmd>Telescope find_dotfiles<cr>", desc = "Dotfiles" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
      { "<leader>fG", "<cmd>Telescope grep_string<cr>", desc = "Grep String" },
      { "<leader>fi", "<cmd>Telescope highlights<cr>", desc = "Highlights" },
      { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
      { "<leader>fm", "<cmd>Telescope marks<cr>", desc = "Marks" },
      { "<leader>fp", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Old Files" },
      { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "LSP Symbols" },
    }
  end,
}
