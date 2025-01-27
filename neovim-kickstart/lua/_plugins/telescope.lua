return { -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      'nvim-telescope/telescope-fzf-native.nvim',
      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = 'make',
      -- `cond` is a condition used to determine whether this plugin should be installed and loaded.
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function(opts)
    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    local builtin = require 'telescope.builtin'
    local actions = require 'telescope.actions'
    local previewers = require 'telescope.previewers'
    local sorters = require 'telescope.sorters'

    local find_files_no_ignore = function()
      local action_state = require 'telescope.actions.state'
      local line = action_state.get_current_line()

      builtin.find_files { no_ignore = true, default_text = line }
    end

    local find_files_with_hidden = function()
      local action_state = require 'telescope.actions.state'
      local line = action_state.get_current_line()

      builtin.find_files { hidden = true, default_text = line }
    end

    local select_one_or_multi = function(prompt_bufnr)
      local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
      local multi = picker:get_multi_selection()

      if not vim.tbl_isempty(multi) then
        require('telescope.actions').close(prompt_bufnr)

        for _, j in pairs(multi) do
          if j.path ~= nil then
            vim.cmd(string.format('%s %s', 'edit', j.path))
          end
        end
      else
        require('telescope.actions').select_default(prompt_bufnr)
      end
    end

    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = "[S]earch Recent Files ('.' for repeat)" })
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    -- It"s also possible to pass additional configuration options. See `:help telescope.builtin.live_grep()` for information about particular keys
    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[S]earch [/] in Open Files' })

    -- Shortcut for searching your Neovim configuration files
    vim.keymap.set('n', '<leader>sn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[S]earch [N]eovim files' })

    local width = 0.95
    local height = 0.95

    return {
      pickers = {
        buffers = {
          show_all_buffers = true,
          sort_lastused = true,
          sort_mru = true,
          previewer = false,
          theme = 'dropdown',
          mappings = {
            i = {
              ['<c-d>'] = 'delete_buffer',
            },
          },
        },
      },
      defaults = {
        prompt_prefix = ' ',
        selection_caret = ' ',
        entry_prefix = '  ',
        set_env = { ['COLORTERM'] = 'truecolor' },
        initial_mode = 'insert',
        selection_strategy = 'reset',
        sorting_strategy = 'ascending',
        layout_strategy = 'horizontal',
        layout_config = {
          prompt_position = 'top',
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
          'rg',
          '--color=never',
          '--vimgrep',
          '--hidden',
          '--smart-case',
          '--trim',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
        },
        mappings = {
          i = {
            ['<esc>'] = actions.close,

            ['<c-enter>'] = 'to_fuzzy_refine',

            ['<c-g>'] = find_files_no_ignore,
            ['<c-h>'] = find_files_with_hidden,

            ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
            ['<c-w>'] = actions.send_selected_to_qflist + actions.open_qflist,

            ['<C-f>'] = actions.preview_scrolling_down,
            ['<C-b>'] = actions.preview_scrolling_up,
            ['<C-j>'] = actions.cycle_history_next,
            ['<C-k>'] = actions.cycle_history_prev,
            ['<C-n>'] = actions.move_selection_next,
            ['<C-p>'] = actions.move_selection_previous,

            ['<CR>'] = select_one_or_multi,
          },
          n = {
            ['q'] = actions.close,
          },
        },
        file_ignore_patterns = { 'gtk/**/*', 'node_modules', '.git', 'pdf_viewer' },
        color_devicons = true,
        use_less = true,
        path_display = {},
        file_previewer = previewers.vim_buffer_cat.new,
        grep_previewer = previewers.vim_buffer_vimgrep.new,
        qflist_previewer = previewers.vim_buffer_qflist.new,
        file_sorter = sorters.get_fuzzy_file,
        generic_sorter = sorters.get_generic_fuzzy_sorter,
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      },
    }
  end,
}
