return {
  "nvim-telescope/telescope.nvim",
  opts = function()
    local actions = require("telescope.actions")

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

    local width = 0.95
    local height = 0.95

    local previewers = require("telescope.previewers")
    local sorters = require("telescope.sorters")

    return {
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
        -- open files in the first window that is an actual file.
        -- use the current window if no other window is available.
        get_selection_window = function()
          local wins = vim.api.nvim_list_wins()
          table.insert(wins, 1, vim.api.nvim_get_current_win())
          for _, win in ipairs(wins) do
            local buf = vim.api.nvim_win_get_buf(win)
            if vim.bo[buf].buftype == "" then
              return win
            end
          end
          return 0
        end,
        mappings = {
          i = {
            ["<esc>"] = actions.close,

            ["<c-t>"] = open_with_trouble,
            ["<a-t>"] = open_selected_with_trouble,
            ["<a-i>"] = find_files_no_ignore,
            ["<a-h>"] = find_files_with_hidden,

            ["<C-f>"] = actions.preview_scrolling_down,
            ["<C-b>"] = actions.preview_scrolling_up,
            ["<C-j>"] = actions.cycle_history_next,
            ["<C-k>"] = actions.cycle_history_prev,
            ["<C-n>"] = actions.move_selection_next,
            ["<C-p>"] = actions.move_selection_previous,
          },
          n = {
            ["q"] = actions.close,
          },
        },

        file_previewer = previewers.vim_buffer_cat.new,
        grep_previewer = previewers.vim_buffer_vimgrep.new,
        qflist_previewer = previewers.vim_buffer_qflist.new,

        file_sorter = sorters.get_fuzzy_file,
        file_ignore_patterns = { "gtk/**/*", "node_modules", ".git", "pdf_viewer" },
        generic_sorter = sorters.get_generic_fuzzy_sorter,
      },
    }
  end,
  keys = function()
    return {
      {
        "<leader>fp",
        "<cmd>Telescope find_files hidden=true layout_config={'prompt_position':'top'}<cr>",
        desc = "Find Files",
      },
      { "<leader>fa", "<cmd>Telescope autocommands<cr>", desc = "Autocommands" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Commands" },
      { "<leader>fd", "<cmd>Telescope find_dotfiles<cr>", desc = "Dotfiles" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
      { "<leader>fG", "<cmd>Telescope grep_string<cr>", desc = "Grep String" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
      { "<leader>fi", "<cmd>Telescope highlights<cr>", desc = "Highlights" },
      { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
      { "<leader>fm", "<cmd>Telescope marks<cr>", desc = "Marks" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Old Files" },
      {
        "<leader>fp",
        "<cmd>Telescope find_files hidden=true layout_config={'prompt_position':'top'}<cr>",
        desc = "Files",
      },
      { "<leader>fr", "<cmd>Telescope lsp_document_symbols<cr>", desc = "LSP Symbols" },
      {
        "<leader>fw",
        "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>",
        desc = "Current Buffer",
      },
    }
  end,
}