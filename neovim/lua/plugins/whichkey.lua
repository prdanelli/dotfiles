return {
  "folke/which-key.nvim",
  event = "VimEnter",
  config = function()
    local module_name = "which-key"
    local whichkey = require(module_name)

    local conf = {
      show_help = false,
      ignore_missing = true,
      plugins = {
        marks = false,
        registers = false,
        presets = {
          operators = false,
          motions = false,
          text_objects = false, -- help for text objects triggered after entering an operator
          windows = false, -- default bindings on <c-w>
          nav = true, -- misc bindings to work with windows
          z = false, -- bindings for folds, spelling and others prefixed with z
          g = false, -- bindings for prefixed with g
          b = false,
        },
      },
      window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 0, 0, 0, 0 },
        padding = { 0, 1, 0, 1 },
        winblend = 0,
      },
      layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 1, max = 50 }, -- min and max width of the columns
        spacing = 10, -- spacing between columns
        align = "center", -- align columns left, center or right
      },
      triggers_blacklist = {
        i = { "j", "k" },
        v = { "j", "k" },
        n = { "b" }, -- Ensure b isn't used by whichkey as it slows it down a lot
      },
    }
    whichkey.setup(conf)

    local n_opts = {
      mode = "n",
      prefix = "<leader>",
      buffer = nil,
      silent = true,
      noremap = true,
      nowait = false,
    }

    whichkey.register({
      ["a"] = { "<cmd>Alpha<cr>", "Startup Screen" },
      ["-"] = { ":split<CR>", "Horizonal Split" },
      ["\\"] = { ":vsplit<CR>", "Vertical Split" },

      b = {
        name = "Buffer",
        --[[ c = { "<Cmd>close<Cr>", "Close split" }, ]]
        w = { "<Cmd>bd!<Cr>", "Close current" },
        D = { "<Cmd>%bd|e#|bd#<Cr>", "Delete all" },
        i = { "mpgg=G<esc>`p", "Indent" },
        f = { "<cmd>Format<cr>", "Format" },
        c = { "<cmd>set tabstop=2 shiftwidth=2 expandtab | retab<cr>", "Convert tabs to spaces" },
        ["1"] = { "<Cmd>BufferLineGoToBuffer 1<CR>", "Goto Buffer 1" },
        ["2"] = { "<Cmd>BufferLineGoToBuffer 2<CR>", "Goto Buffer 2" },
        ["3"] = { "<Cmd>BufferLineGoToBuffer 3<CR>", "Goto Buffer 3" },
        ["4"] = { "<Cmd>BufferLineGoToBuffer 4<CR>", "Goto Buffer 4" },
        ["5"] = { "<Cmd>BufferLineGoToBuffer 5<CR>", "Goto Buffer 5" },
        ["6"] = { "<Cmd>BufferLineGoToBuffer 6<CR>", "Goto Buffer 6" },
        ["7"] = { "<Cmd>BufferLineGoToBuffer 7<CR>", "Goto Buffer 7" },
        ["8"] = { "<Cmd>BufferLineGoToBuffer 8<CR>", "Goto Buffer 8" },
        ["9"] = { "<Cmd>BufferLineGoToBuffer 9<CR>", "Goto Buffer 9" },
      },

      c = {
        name = "Convert Text",
        u = { "<cmd>lua require('textcase').current_word('to_upper_case')<CR>", "Upper Case" },
        l = { "<cmd>lua require('textcase').current_word('to_lower_case')<CR>", "Lower Case" },
        s = { "<cmd>lua require('textcase').current_word('to_snake_case')<CR>", "Snake Case" },
        d = { "<cmd>lua require('textcase').current_word('to_dash_case')<CR>", "Dash Case" },
        n = { "<cmd>lua require('textcase').current_word('to_constant_case')<CR>", "Constant Case" },
        o = { "<cmd>lua require('textcase').current_word('to_dot_case')<CR>", "Dot Case" },
        p = { "<cmd>lua require('textcase').current_word('to_phrase_case')<CR>", "Phrase Case" },
        c = { "<cmd>lua require('textcase').current_word('to_camel_case')<CR>", "Camel Case" },
        s = { "<cmd>lua require('textcase').current_word('to_pascal_case')<CR>", "Pascal Case" },
        t = { "<cmd>lua require('textcase').current_word('to_title_case')<CR>", "Title Case" },
        a = { "<cmd>lua require('textcase').current_word('to_path_case')<CR>", "Path Case" },
      },

      f = {
        name = "Find",
        a = { "<cmd>Telescope autocommands<cr>", "Autocommands" },
        b = { "<cmd>Telescope buffers<cr>", "Buffers" },
        c = { "<cmd>Telescope commands<cr>", "Commands" },
        d = { "<cmd>Telescope find_dotfiles<cr>", "Dotfiles" },
        e = { "<cmd>RnvimrToggle<CR>", "Ranger" },
        g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
        G = { "<cmd>Telescope grep_string<cr>", "Grep String" },
        h = { "<cmd>Telescope help_tags<cr>", "Help" },
        i = { "<cmd>Telescope highlights<cr>", "Highlights" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        m = { "<cmd>Telescope marks<cr>", "Marks" },
        r = { "<cmd>Telescope oldfiles<cr>", "Old Files" },
        p = { "<cmd>Telescope find_files hidden=true layout_config={'prompt_position':'top'}<cr>", "Files" },
        r = { "<cmd>Telescope lsp_document_symbols<cr>", "LSP Symbols" },
        t = { "<cmd>Neotree<cr>", "Tree Explorer" },
        w = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", "Current Buffer" },
      },

      g = {
        name = "Git",
        b = { "<cmd>Gitsigns toggle_current_line_blame<CR>", "Blame" },

        s = { "", "Search" },
        sb = { "<cmd>Telescope advanced_git_search diff_branch_file<CR>", "Search Branches" },
        sp = { "<cmd>Telescope advanced_git_search search_log_content<CR>", "Search Previous Commits" },
        sf = { "<cmd>Telescope advanced_git_search diff_commit_file<CR>", "Search Previous Commits in File" },
        sr = { "<cmd>Telescope advanced_git_search checkout_reflog<CR>", "Search Reflog" },

        o = { "<cmd>GitConflictChooseOurs<cr>", "Conflict - Choose Ours" },
        t = { "<cmd>GitConflictChooseTheirs<cr>", "Conflict - Choose Theirs" },
        b = { "<cmd>GitConflictChooseBoth<cr>", "Conflict - Choose Both" },
        n = { "<cmd>GitConflictChooseNone<cr>", "Conflict - Choose None" },
        q = { "<cmd>GitConflictListQf<cr>", "Conflict - Quicklist" },
        ["]"] = { "<cmd>GitConflictNextConflict<cr>", "Conflict - Goto Next" },
        ["["] = { "<cmd>GitConflictPrevConflict<cr>", "Conflict - Goto Previous" },
        l = {
          "<cmd>lua require('gitlinker').get_buf_range_url('n', { action_callback = require('gitlinker.actions').open_in_browser })<cr>",
          "Git Link",
        },
      },

      s = {
        name = "Sessions",
        r = { [[<cmd>lua require("persistence").load()<cr>]], "Restore (Directory)" },
        l = { [[<cmd>lua require("persistence").load({ last = true })<cr>]], "Restore" },
        s = { [[<cmd>lua require("persistence").stop()<cr>]], "Stop" },
      },

      t = {
        name = "Terminal",
        l = { "<cmd>:lua _toggle_lazygit()<CR>", "Lazygit" },
        c = { "<cmd>:lua _toggle_console()<CR>", "Console" },
        i = { "<cmd>:lua _toggle_irb()<CR>", "IRB" },
        h = { "<cmd>:lua _toggle_htop()<CR>", "htop" },
      },

      x = {
        name = "Trouble",
        x = { "<cmd>Trouble<cr>", "Open" },
        w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
        d = { "<cmd>Trouble document_diagnostics<cr>", "Document Diagnostics" },
        l = { "<cmd>Trouble loclist<cr>", "Loclist" },
        q = { "<cmd>Trouble quickfix<cr>", "Quick Fix" },
        r = { "<cmd>Trouble lsp_references<cr>", "LSP References" },
      },

      y = {
        name = "Yank",
        p = {
          "<cmd>let @+ = expand('%:~:.')<cr> <cmd>lua vim.notifier.info('Yanked relative path')<cr>",
          "Relative Path",
        },
        f = { "<cmd>let @+ = expand('%:p')<cr> <cmd>lua vim.notifier.info('Yanked full path')<cr>", "Full Path" },
        a = { "<cmd>%y<cr>", "Buffer contents" },
      },

      z = {
        name = "System",
        f = { "<cmd>echo &filetype<cr>", "Filetype" },
        r = { "<cmd>luafile %<cr> <cmd>lua vim.notifier.info('Sourced file')<cr>", "Source file" },
        x = { "<cmd>cd %:p:h<cr>", "Change Directory" },
        e = { "!!$SHELL<CR>", "Execute Shell" },
        w = { "<cmd>update!<CR>", "Save" },
        q = { "<cmd>q!<CR>", "Quit" },
        s = { "<cmd>ScratchPad<cr>", "ScratchPad" },
      },
    }, n_opts)
  end,
}
