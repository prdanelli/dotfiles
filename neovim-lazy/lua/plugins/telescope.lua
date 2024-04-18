return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "natecraddock/telescope-zf-native.nvim" },
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

    require("telescope").load_extension("zf-native")

    local width = 0.95
    local height = 0.95

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
          },
          n = {
            ["q"] = actions.close,
          },
        },
        file_ignore_patterns = { "gtk/**/*", "node_modules", ".git", "pdf_viewer" },
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        extensions = {
          ["zf-native"] = {
            file = {
              enable = true, -- override default telescope file sorter
              highlight_results = true, -- highlight matching text in results
              match_filename = true, -- enable zf filename match priority
            },
            generic = {
              enable = true, -- override default telescope generic item sorter
              highlight_results = true, -- highlight matching text in results
              match_filename = false, -- disable zf filename match priority
            },
          },
        },
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
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
      { "<leader>fi", "<cmd>Telescope highlights<cr>", desc = "Highlights" },
      { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
      { "<leader>fm", "<cmd>Telescope marks<cr>", desc = "Marks" },
      { "<leader>fp", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Old Files" },
      { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "LSP Symbols" },
    }
  end,
}
