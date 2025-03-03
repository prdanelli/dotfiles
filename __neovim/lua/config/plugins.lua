require("lazy").setup({
  defaults = {
    lazy = false,
    version = false,
  },
  change_detection = {
    enabled = true,
    notify = false,
  },
  concurrency = 50,
  install = {
    colorscheme = {
      "onenord",
    },
  },
  checker = {
    enabled = true,
    notify = false,
  },
  ui = {
    size = {
      width = 0.6,
      height = 0.6,
    },
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  spec = {
    {
      import = "plugins",
    },

    "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

    {
      "lewis6991/gitsigns.nvim",
      opts = {
        signs = {
          add = { text = "+" },
          change = { text = "~" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
        },
        signs_staged = {
          add = { text = "┃" },
          change = { text = "┃" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "┆" },
        },
        signs_staged_enable = true,
        signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
        numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir = {
          follow_files = true,
        },
        auto_attach = true,
        attach_to_untracked = false,
        current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
          delay = 1000,
          ignore_whitespace = false,
          virt_text_priority = 100,
          use_focus = true,
        },
        current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        max_file_length = 40000, -- Disable if file is longer than this (in lines)
        preview_config = {
          -- Options passed to nvim_open_win
          border = "single",
          style = "minimal",
          relative = "cursor",
          row = 0,
          col = 1,
        },
      },
    },

    {
      "folke/which-key.nvim",
      event = "VimEnter", -- Sets the loading event to 'VimEnter'
      opts = {
        delay = 100, -- delay between pressing key & opening which-key (milliseconds) independent of vim.opt.timeoutlen
        preset = "helix", -- "classic" | "modern" | "helix"
        notify = true,
        plugins = {
          marks = true, -- shows a list of your marks on ' and `
          registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
          spelling = {
            enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
          },
          presets = {
            operators = true, -- adds help for operators like d, y, ...
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
          },
        },
        win = {
          padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
          title = false,
          title_pos = "center",
          wo = {
            winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
          },
        },
        show_help = true, -- show a help message in the command line for using WhichKey
        show_keys = true, -- show the currently pressed key and its label as a message in the command line
        icons = {
          mappings = vim.g.have_nerd_font, -- set icon mappings to true if you have a Nerd Font
          colors = false,
          keys = vim.g.have_nerd_font and {} or {
            Up = " ",
            Down = " ",
            Left = " ",
            Right = " ",
            C = "󰘴 ",
            M = "󰘵 ",
            D = "󰘳 ",
            S = "󰘶 ",
            CR = "󰌑 ",
            Esc = "<Esc> ",
            ScrollWheelDown = "󱕐 ",
            ScrollWheelUp = "󱕑 ",
            NL = "󰌑 ",
            BS = "󰁮",
            Space = "󱁐 ",
            Tab = "󰌒 ",
            F1 = "<F1>",
            F2 = "<F2>",
            F3 = "<F3>",
            F4 = "<F4>",
            F5 = "<F5>",
            F6 = "<F6>",
            F7 = "<F7>",
            F8 = "<F8>",
            F9 = "<F9>",
            F10 = "<F10>",
            F11 = "<F11>",
            F12 = "<F12>",
          },
        },
        spec = {
          { "<leader>a", group = "[A]vante" },
          { "<leader>b", group = "[B]uffers" },
          { "<leader>c", group = "[C]ode", mode = { "n", "x" } },
          { "<leader>d", group = "[D]ocument" },
          { "<leader>g", group = "[G]it" },
          { "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
          { "<leader>r", group = "[R]ename" },
          { "<leader>s", group = "[S]earch" },
          { "<leader>w", group = "[W]orkspace" },
          { "<leader>t", group = "[T]oggle" },
          { "<leader>u", group = "[U]I Toggles" },
          { "<leader>x", group = "Trouble" },
          { "<leader>y", group = "[Y]ank" },
        },
      },
    },

    {
      "kelly-lin/ranger.nvim",
      config = function()
        local ranger_nvim = require("ranger-nvim")

        ranger_nvim.setup({
          replace_netrw = true,
          enable_cmds = false,
          keybinds = {
            ["ov"] = ranger_nvim.OPEN_MODE.vsplit,
            ["oh"] = ranger_nvim.OPEN_MODE.split,
            ["<cr>"] = ranger_nvim.OPEN_MODE.tabedit,
            ["or"] = ranger_nvim.OPEN_MODE.rifle,
          },
          ui = {
            border = "rounded",
            height = 0.9,
            width = 0.9,
            x = 0.5,
            y = 0.5,
          },
        })

        vim.keymap.set(
          "n",
          "<leader>se",
          "<cmd>lua require('ranger-nvim').open(true)<cr>",
          { silent = true, desc = "Search [E]xplore" }
        )
      end,
    },

    {
      "folke/snacks.nvim",
      priority = 1000,
      lazy = false,
      opts = {
        bigfile = { enabled = true },
        bufdelete = { enabled = true },
        indent = { enabled = false },
        input = { enabled = true },
        git = { enabled = true },
        gitbrowse = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        rename = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = true },
        statuscolumn = { enabled = true },
        toggle = { enabled = true },
        words = { enabled = true },
        zen = { enabled = true },
        picker = {
          prompt = " ",
          hidden = true,
          backdrop = 50,
          sources = {},
          layout = {
            cycle = true,
            preset = "mivy",
          },
          layouts = {
            mivy = {
              layout = {
                box = "vertical",
                backdrop = 50,
                row = -1,
                width = 0,
                height = 0.5,
                border = "top",
                title = "{title} {live} {flags}",
                {
                  box = "horizontal",
                  {
                    box = "vertical",
                    { win = "input", height = 2 },
                    { win = "list" },
                  },
                  { win = "preview", title = "{preview}", width = vim.o.columns <= 125 and 0.7 or 0.55 },
                },
              },
            },
          },
          matcher = {
            fuzzy = true, -- use fuzzy matching
            smartcase = true, -- use smartcase
            ignorecase = true, -- use ignorecase
            sort_empty = false, -- sort results when the search string is empty
            filename_bonus = true, -- give bonus for matching file names (last part of the path)
            file_pos = true, -- support patterns like `file:line:col` and `file:line`
            -- the bonusses below, possibly require string concatenation and path normalization,
            -- so this can have a performance impact for large lists and increase memory usage
            cwd_bonus = true, -- give bonus for matching files in the cwd
            frecency = true, -- frecency bonus
          },
          sort = {
            -- default sort is by score, text length and index
            fields = { "score:desc", "#text", "idx" },
          },
          ui_select = true,
          formatters = {
            text = {
              ft = nil, ---@type string? filetype for highlighting
            },
            file = {
              filename_first = false, -- display filename before the file path
              truncate = 40, -- truncate the file path to (roughly) this length
              filename_only = false, -- only show the filename
            },
            selected = {
              show_always = false, -- only show the selected column when there are multiple selections
              unselected = true, -- use the unselected icon for unselected items
            },
          },
          previewers = {
            git = {
              native = false, -- use native (terminal) or Neovim for previewing git diffs and commits
            },
            file = {
              max_size = 1024 * 1024, -- 1MB
              max_line_length = 500, -- max line length
              ft = nil, ---@type string? filetype for highlighting. Use `nil` for auto detect
            },
            man_pager = nil, ---@type string? MANPAGER env to use for `man` preview
          },
          jump = {
            jumplist = true, -- save the current position in the jumplist
            tagstack = false, -- save the current position in the tagstack
            reuse_win = false, -- reuse an existing window if the buffer is already open
          },
          win = {
            input = {
              keys = {
                ["<Esc>"] = { "close", mode = { "i", "n" } },
                ["<C-c>"] = { "close", mode = { "i", "n" } },
                -- to close the picker on ESC instead of going to normal mode,
                -- add the following keymap to your config
                -- ["<Esc>"] = { "close", mode = { "n", "i" } },
                ["<CR>"] = { "confirm", mode = { "n", "i" } },
                ["G"] = "list_bottom",
                ["gg"] = "list_top",
                ["j"] = "list_down",
                ["k"] = "list_up",
                ["/"] = "toggle_focus",
                ["q"] = "close",
                ["?"] = "toggle_help",
                ["<a-d>"] = { "inspect", mode = { "n", "i" } },
                ["<c-a>"] = { "select_all", mode = { "n", "i" } },
                ["<a-m>"] = { "toggle_maximize", mode = { "i", "n" } },
                ["<a-p>"] = { "toggle_preview", mode = { "i", "n" } },
                ["<a-w>"] = { "cycle_win", mode = { "i", "n" } },
                ["<C-w>"] = { "<c-s-w>", mode = { "i" }, expr = true, desc = "delete word" },
                ["<C-Up>"] = { "history_back", mode = { "i", "n" } },
                ["<C-Down>"] = { "history_forward", mode = { "i", "n" } },
                ["<Tab>"] = { "select_and_next", mode = { "i", "n" } },
                ["<S-Tab>"] = { "select_and_prev", mode = { "i", "n" } },
                ["<Down>"] = { "list_down", mode = { "i", "n" } },
                ["<Up>"] = { "list_up", mode = { "i", "n" } },
                ["<c-j>"] = { "list_down", mode = { "i", "n" } },
                ["<c-k>"] = { "list_up", mode = { "i", "n" } },
                ["<c-n>"] = { "list_down", mode = { "i", "n" } },
                ["<c-p>"] = { "list_up", mode = { "i", "n" } },
                ["<c-l>"] = { "preview_scroll_left", mode = { "i", "n" } },
                ["<c-h>"] = { "preview_scroll_right", mode = { "i", "n" } },
                ["<c-b>"] = { "preview_scroll_up", mode = { "i", "n" } },
                ["<c-d>"] = { "list_scroll_down", mode = { "i", "n" } },
                ["<c-f>"] = { "preview_scroll_down", mode = { "i", "n" } },
                ["<c-g>"] = { "toggle_live", mode = { "i", "n" } },
                ["<c-u>"] = { "list_scroll_up", mode = { "i", "n" } },
                ["<ScrollWheelDown>"] = { "list_scroll_wheel_down", mode = { "i", "n" } },
                ["<ScrollWheelUp>"] = { "list_scroll_wheel_up", mode = { "i", "n" } },
                ["<c-v>"] = { "edit_vsplit", mode = { "i", "n" } },
                ["<c-s>"] = { "edit_split", mode = { "i", "n" } },
                ["<c-q>"] = { "qflist", mode = { "i", "n" } },
                ["<a-i>"] = { "toggle_ignored", mode = { "i", "n" } },
                ["<a-h>"] = { "toggle_hidden", mode = { "i", "n" } },
                ["<a-f>"] = { "toggle_follow", mode = { "i", "n" } },
              },
              b = {
                minipairs_disable = true,
              },
            },
            list = {
              keys = {
                ["<CR>"] = "confirm",
                ["gg"] = "list_top",
                ["G"] = "list_bottom",
                ["i"] = "focus_input",
                ["j"] = "list_down",
                ["k"] = "list_up",
                ["q"] = "close",
                ["<Tab>"] = "select_and_next",
                ["<S-Tab>"] = "select_and_prev",
                ["<Down>"] = "list_down",
                ["<Up>"] = "list_up",
                ["<a-d>"] = "inspect",
                ["<c-d>"] = "list_scroll_down",
                ["<c-u>"] = "list_scroll_up",
                ["zt"] = "list_scroll_top",
                ["zb"] = "list_scroll_bottom",
                ["zz"] = "list_scroll_center",
                ["/"] = "toggle_focus",
                ["<ScrollWheelDown>"] = "list_scroll_wheel_down",
                ["<ScrollWheelUp>"] = "list_scroll_wheel_up",
                ["<c-a>"] = "select_all",
                ["<c-f>"] = "preview_scroll_down",
                ["<c-b>"] = "preview_scroll_up",
                ["<c-l>"] = "preview_scroll_right",
                ["<c-h>"] = "preview_scroll_left",
                ["<c-v>"] = "edit_vsplit",
                ["<c-s>"] = "edit_split",
                ["<c-j>"] = "list_down",
                ["<c-k>"] = "list_up",
                ["<c-n>"] = "list_down",
                ["<c-p>"] = "list_up",
                ["<a-w>"] = "cycle_win",
                ["<Esc>"] = "close",
              },
              wo = {
                conceallevel = 2,
                concealcursor = "nvc",
              },
            },
            preview = {
              keys = {
                ["<Esc>"] = "close",
                ["q"] = "close",
                ["i"] = "focus_input",
                ["<ScrollWheelDown>"] = "list_scroll_wheel_down",
                ["<ScrollWheelUp>"] = "list_scroll_wheel_up",
                ["<a-w>"] = "cycle_win",
              },
            },
          },
          icons = {
            files = {
              enabled = true, -- show file icons
            },
            keymaps = {
              nowait = "󰓅 ",
            },
            indent = {
              vertical = "│ ",
              middle = "├╴",
              last = "└╴",
            },
            undo = {
              saved = " ",
            },
            ui = {
              live = "󰐰 ",
              hidden = "h",
              ignored = "i",
              follow = "f",
              selected = "● ",
              unselected = "○ ",
              -- selected = " ",
            },
            git = {
              commit = "󰜘 ",
            },
            diagnostics = {
              Error = " ",
              Warn = " ",
              Hint = " ",
              Info = " ",
            },
            kinds = {
              Array = " ",
              Boolean = "󰨙 ",
              Class = " ",
              Color = " ",
              Control = " ",
              Collapsed = " ",
              Constant = "󰏿 ",
              Constructor = " ",
              Copilot = " ",
              Enum = " ",
              EnumMember = " ",
              Event = " ",
              Field = " ",
              File = " ",
              Folder = " ",
              Function = "󰊕 ",
              Interface = " ",
              Key = " ",
              Keyword = " ",
              Method = "󰊕 ",
              Module = " ",
              Namespace = "󰦮 ",
              Null = " ",
              Number = "󰎠 ",
              Object = " ",
              Operator = " ",
              Package = " ",
              Property = " ",
              Reference = " ",
              Snippet = "󱄽 ",
              String = " ",
              Struct = "󰆼 ",
              Text = " ",
              TypeParameter = " ",
              Unit = " ",
              Unknown = " ",
              Value = " ",
              Variable = "󰀫 ",
            },
          },
          debug = {
            scores = false, -- show scores in the list
            leaks = false, -- show when pickers don't get garbage collected
          },
        },

        dashboard = {
          preset = {
            header = [[
    ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
    ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
    ░░░░░░░░░░░░░░░██╗░██╗███████╗██╗░░░░░██╗░░░░░░█████╗░░░░░░░░░░░░░░░░
    ░░░░░░░░░░░░░░░██║░██║██╔════╝██║░░░░░██║░░░░░██╔══██╗░░░░░░░░░░░░░░░
    ░░░░░░░░░░░░░░░██████║█████╗░░██║░░░░░██║░░░░░██║░░██║░░░░░░░░░░░░░░░
    ░░░░░░░░░░░░░░░██╔═██║██╔══╝░░██║░░░░░██║░░░░░██║░░██║░░░░░░░░░░░░░░░
    ░░░░░░░░░░░░░░░██║░██║███████╗███████╗███████╗╚█████╔╝░░░░░░░░░░░░░░░
    ░░░░░░░░░░░░░░░╚═╝░╚═╝╚══════╝╚══════╝╚══════╝░╚════╝░░░░░░░░░░░░░░░░
    ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
    ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
    ░░░░░░░░░░░░██╗░░░░░░░██╗░█████╗░██████╗░██╗░░░░░██████╗░░░░░░░░░░░░░
    ░░░░░░░░░░░░██║░░██╗░░██║██╔══██╗██╔══██╗██║░░░░░██╔══██╗░░░░░░░░░░░░
    ░░░░░░░░░░░░╚██╗████╗██╔╝██║░░██║██████╔╝██║░░░░░██║░░██║░░░░░░░░░░░░
    ░░░░░░░░░░░░░████╔═████║░██║░░██║██╔══██╗██║░░░░░██║░░██║░░░░░░░░░░░░
    ░░░░░░░░░░░░░╚██╔╝░╚██╔╝░╚█████╔╝██║░░██║███████╗██████╔╝░░░░░░░░░░░░
    ░░░░░░░░░░░░░░╚═╝░░░╚═╝░░░╚════╝░╚═╝░░╚═╝╚══════╝╚═════╝░░░░░░░░░░░░░
    ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
    ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
    ]],
            keys = {
              { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
              { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
              { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
              { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
              { icon = "󰙅 ", key = "e", desc = "File Exporer", action = ":lua require('ranger-nvim').open(true)" },
              {
                icon = " ",
                key = "c",
                desc = "Config",
                action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
              },
              { icon = " ", key = "s", desc = "Restore Session", section = "session" },
              { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
              { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
              { icon = " ", key = "q", desc = "Quit", action = ":qa" },
            },
          },
        },
      },
      keys = {
        {
          "<leader>sb",
          function()
            Snacks.picker.buffers({
              unloaded = true,
              current = true,
              layout = {
                preset = "mivy",
              },
              win = {
                input = {
                  keys = {
                    ["<c-x>"] = { "bufdelete", mode = { "n", "i" } },
                  },
                },
              },
            })
          end,
          desc = "Buffers",
        },
        {
          "<leader><leader>",
          function()
            Snacks.picker.files({ finder = "files", hidden = true, layout = { preset = "mivy" } })
          end,
          desc = "[F]iles",
        },
        {
          "<leader>s~",
          function()
            Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
          end,
          desc = "Find Config File",
        },
        {
          "<leader>st",
          function()
            Snacks.picker.explorer({ hidden = true })
          end,
          desc = "[T]ree",
        },
        {
          "<leader>sr",
          function()
            Snacks.picker.recent()
          end,
          desc = "[R]ecent",
        },

        -- Git
        {
          "<leader>sG",
          function()
            Snacks.picker.git_files({ finder = "git_files", hidden = true, show_empty = false })
          end,
          desc = "[G]it Files",
        },
        {
          "<leader>gc",
          function()
            Snacks.picker.git_log()
          end,
          desc = "Git [L]og",
        },
        {
          "<leader>gs",
          function()
            Snacks.picker.git_status()
          end,
          desc = "Git [S]tatus",
        },

        -- Buffer
        {
          "<leader>sl",
          function()
            Snacks.picker.lines({})
          end,
          desc = "Buffer [L]ines",
        },
        {
          "<leader>sB",
          function()
            Snacks.picker.grep_buffers()
          end,
          desc = "Grep Open [B]uffers",
        },

        -- Grep
        {
          "<leader>sg",
          function()
            Snacks.picker.grep()
          end,
          desc = "[G]rep",
        },
        {
          "<leader>sw",
          function()
            Snacks.picker.grep_word()
          end,
          desc = "[W]ord",
          mode = { "n", "x" },
        },

        -- LSP
        {
          "<leader>sd",
          function()
            Snacks.picker.diagnostics()
          end,
          desc = "[D]iagnostics",
        },
        {
          "gd",
          function()
            Snacks.picker.lsp_definitions()
          end,
          desc = "Goto [D]efinition",
        },
        {
          "gr",
          function()
            Snacks.picker.lsp_references()
          end,
          nowait = true,
          desc = "[R]eferences",
        },
        {
          "gI",
          function()
            Snacks.picker.lsp_implementations()
          end,
          desc = "Goto [I]mplementation",
        },
        {
          "gy",
          function()
            Snacks.picker.lsp_type_definitions()
          end,
          desc = "Goto T[y]pe Definition",
        },
        {
          "<leader>ss",
          function()
            Snacks.picker.lsp_symbols()
          end,
          desc = "LSP [S]ymbols",
        },

        -- Neovim
        {
          '<leader>s"',
          function()
            Snacks.picker.registers()
          end,
          desc = "[R]egisters",
        },
        {
          "<leader>sa",
          function()
            Snacks.picker.autocmds()
          end,
          desc = "[A]uto Commands",
        },
        {
          "<leader>sc",
          function()
            Snacks.picker.command_history()
          end,
          desc = "[C]ommand History",
        },
        {
          "<leader>sC",
          function()
            Snacks.picker.commands()
          end,
          desc = "[C]ommands",
        },
        {
          "<leader>sh",
          function()
            Snacks.picker.help()
          end,
          desc = "[H]elp Pages",
        },
        {
          "<leader>sH",
          function()
            Snacks.picker.highlights()
          end,
          desc = "[H]ighlights",
        },
        {
          "<leader>sj",
          function()
            Snacks.picker.jumps()
          end,
          desc = "[J]umps",
        },
        {
          "<leader>sk",
          function()
            Snacks.picker.keymaps()
          end,
          desc = "[K]eymaps",
        },
        {
          "<leader>sL",
          function()
            Snacks.picker.loclist()
          end,
          desc = "[L]ocation List",
        },
        {
          "<leader>sM",
          function()
            Snacks.picker.man()
          end,
          desc = "[M]an Pages",
        },
        {
          "<leader>sm",
          function()
            Snacks.picker.marks()
          end,
          desc = "[M]arks",
        },
        {
          "<leader>sq",
          function()
            Snacks.picker.qflist()
          end,
          desc = "[Q]uickfix List",
        },
        {
          "<leader>so",
          function()
            Snacks.picker.colorschemes()
          end,
          desc = "C[o]lorschemes",
        },

        -- Internal
        {
          "<leader>sR",
          function()
            Snacks.picker.resume()
          end,
          desc = "[R]esume",
        },
        {
          "<leader>sp",
          function()
            Snacks.picker.projects()
          end,
          desc = "[P]rojects",
        },
      },
    },

    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },

    {
      -- Main LSP Configuration
      "neovim/nvim-lspconfig",
      dependencies = {
        -- Automatically install LSPs and related tools to stdpath for Neovim
        -- Mason must be loaded before its dependents so we need to set it up here.
        -- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
        { "williamboman/mason.nvim", opts = {} },
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        { "j-hui/fidget.nvim", event = "BufReadPre", opts = {} },
      },
      config = function()
        vim.api.nvim_create_autocmd("LspAttach", {
          group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
          callback = function(event)
            local map = function(keys, func, desc, mode)
              mode = mode or "n"
              vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
            end

            -- Jump to the definition of the word under your cursor. To jump back, press <C-t>.
            map("gd", function()
              Snacks.picker.lsp_definitions()
            end, "[G]oto [D]efinition")

            -- WARN: This is not Goto Definition, this is Goto Declaration.
            --  For example, in C this would take you to the header.
            map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

            -- Find references for the word under your cursor.
            map("gr", function()
              Snacks.picker.lsp_references()
            end, "[G]oto [R]eferences")

            -- Jump to the implementation of the word under your cursor.
            --  Useful when your language has ways of declaring types without an actual implementation.
            map("gI", function()
              Snacks.picker.lsp_implementations()
            end, "[G]oto [I]mplementation")

            -- Jump to the type of the word under your cursor.
            --  Useful when you're not sure what type a variable is and you want to see
            --  the definition of its *type*, not where it was *defined*.
            map("<leader>D", function()
              Snacks.picker.lsp_type_definitions()
            end, "Type [D]efinition")

            -- Fuzzy find all the symbols in your current document.
            --  Symbols are things like variables, functions, types, etc.
            map("<leader>ds", function()
              Snacks.picker.lsp_symbols()
            end, "[D]ocument [S]ymbols")

            -- Rename the variable under your cursor.
            --  Most Language Servers support renaming across files, etc.
            map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

            -- Execute a code action, usually your cursor needs to be on top of an error
            -- or a suggestion from your LSP for this to activate.
            map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })

            -- WARN: This is not Goto Definition, this is Goto Declaration.
            --  For example, in C this would take you to the header.
            map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

            -- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
            ---@param client vim.lsp.Client
            ---@param method vim.lsp.protocol.Method
            ---@param bufnr? integer some lsp support methods only in specific files
            ---@return boolean
            local function client_supports_method(client, method, bufnr)
              if vim.fn.has("nvim-0.11") == 1 then
                return client:supports_method(method, bufnr)
              else
                return client.supports_method(method, { bufnr = bufnr })
              end
            end

            -- The following two autocommands are used to highlight references of the
            -- word under your cursor when your cursor rests there for a little while.
            --    See `:help CursorHold` for information about when this is executed
            --
            -- When you move your cursor, the highlights will be cleared (the second autocommand).
            local client = vim.lsp.get_client_by_id(event.data.client_id)
            if
              client
              and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
            then
              local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
              vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.document_highlight,
              })

              vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
              })

              vim.api.nvim_create_autocmd("LspDetach", {
                group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
                callback = function(event2)
                  vim.lsp.buf.clear_references()
                  vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
                end,
              })
            end

            if
              client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf)
            then
              map("<leader>th", function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
              end, "[T]oggle Inlay [H]ints")
            end
          end,
        })

        vim.diagnostic.config({
          severity_sort = true,
          float = { border = "rounded", source = "if_many" },
          underline = { severity = vim.diagnostic.severity.ERROR },
          signs = vim.g.have_nerd_font and {
            text = {
              [vim.diagnostic.severity.ERROR] = "󰅚 ",
              [vim.diagnostic.severity.WARN] = "󰀪 ",
              [vim.diagnostic.severity.INFO] = "󰋽 ",
              [vim.diagnostic.severity.HINT] = "󰌶 ",
            },
          } or {},
          virtual_text = {
            source = "if_many",
            spacing = 2,
            format = function(diagnostic)
              local diagnostic_message = {}
              return diagnostic_message[diagnostic.severity]
            end,
          },
        })

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

        local servers = {
          ruby_lsp = {},
          lua_ls = {
            settings = {
              Lua = {
                codeLens = {
                  enable = true,
                },
                completion = {
                  callSnippet = "Replace",
                },
                diagnostics = {
                  globals = { "vim", "Snacks" },
                },
                workspace = {
                  checkThirdParty = false,
                },
              },
            },
          },
        }

        local ensure_installed = vim.tbl_keys(servers or {})
        vim.list_extend(ensure_installed, {
          "stylua", -- Used to format Lua code
          "ruby_lsp",
        })
        require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

        require("mason-lspconfig").setup({
          ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
          automatic_installation = false,
          handlers = {
            function(server_name)
              local server = servers[server_name] or {}
              server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
              require("lspconfig")[server_name].setup(server)
            end,
          },
        })
      end,
    },

    {
      "iguanacucumber/magazine.nvim",
      name = "nvim-cmp", -- Otherwise highlighting gets messed up
      lazy = true,
      event = "InsertEnter",
      dependencies = {
        { "iguanacucumber/mag-nvim-lsp", name = "cmp-nvim-lsp", opts = {} },
        { "iguanacucumber/mag-nvim-lua", name = "cmp-nvim-lua" },
        { "iguanacucumber/mag-buffer", name = "cmp-buffer" },
        { "iguanacucumber/mag-cmdline", name = "cmp-cmdline" },
        "https://codeberg.org/FelipeLema/cmp-async-path",
        "hrsh7th/cmp-nvim-lsp-document-symbol", -- For textDocument/documentSymbol
        "lukas-reineke/cmp-under-comparator", -- Tweak completion order
        "f3fora/cmp-spell",
        {
          "Exafunction/codeium.nvim",
          dependencies = {
            "nvim-lua/plenary.nvim",
          },

          config = function()
            require("codeium").setup({
              enable_chat = false,
              enable_local_search = false,
              enable_index_service = false,
            })
          end,
        },
      },
      config = function()
        local cmp_status_ok, cmp = pcall(require, "cmp")
        if not cmp_status_ok then
          return
        end

        local check_backspace = function()
          local col = vim.fn.col(".") - 1

          return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
        end

        local kind_icons = {
          Text = "",
          Method = "",
          Function = "",
          Constructor = "",
          Codeium = "",
          Field = "",
          Variable = "",
          Class = "ﴯ",
          Interface = "",
          Module = "",
          Property = "ﰠ",
          Unit = "",
          Value = "",
          Enum = "",
          Keyword = "",
          Color = "",
          File = "",
          Reference = "",
          Folder = "",
          EnumMember = "",
          Constant = "",
          Struct = "",
          Event = "",
          Operator = "",
          TypeParameter = "",
        }
        local compare = require("cmp.config.compare")
        local types = require("cmp.types")

        cmp.setup({
          mapping = {
            ["<C-n>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif check_backspace() then
                fallback()
              else
                fallback()
              end
            end, { "i", "s" }),
            ["<C-p>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              else
                fallback()
              end
            end, { "i", "s" }),
            ["<C-d>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-e>"] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
          },
          formatting = {
            expandable_indicator = true,
            fields = { "kind", "abbr", "menu" },
            format = function(entry, vim_item)
              vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)

              vim_item.menu = ({
                codeium = "[LLM]",
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                spell = "[Spelling]",
              })[entry.source.name]

              return vim_item
            end,
          },
          sources = {
            {
              name = "lazydev",
              -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
              group_index = 0,
            },
            { name = "codeium" },
            { name = "nvim_lsp" },
            { name = "buffer", keyword_length = 3 },
            { name = "async_path" },
            {
              name = "spell",
              option = {
                keep_all_entries = false,
                enable_in_context = function()
                  return require("cmp.config.context").in_treesitter_capture("spell")
                end,
              },
            },
          },
          confirm_opts = {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
          },
          sorting = {
            priority_weight = 2,
            comparators = {
              compare.offset,
              compare.exact,
              compare.score,
              compare.recently_used,
              compare.locality,
              compare.kind,
              compare.length,
              compare.order,
            },
          },
          window = {
            completion = {
              border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
              winhighlight = "Normal:TelescopePreviewBorder,TelescopePreviewBorder:Pmenu,CursorLine:PmenuSel,Search:None",
              winblend = 0,
              scrolloff = 0,
              col_offset = 0,
              side_padding = 1,
              scrollbar = true,
            },
            documentation = cmp.config.window.bordered({
              border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
              winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
              winblend = 0,
            }),
          },
          experimental = {
            ghost_text = false,
            native_menu = false,
          },
          enabled = function()
            local disabled = false

            disabled = disabled or (vim.api.nvim_get_option_value("buftype", { buf = 0 }) == "prompt")
            disabled = disabled or (vim.fn.reg_recording() ~= "")
            disabled = disabled or (vim.fn.reg_executing() ~= "")

            return not disabled
          end,
          performance = {
            debounce = 60,
            throttle = 30,
            fetching_timeout = 500,
            filtering_context_budget = 3,
            confirm_resolve_timeout = 80,
            async_budget = 1,
            max_view_entries = 200,
          },
          preselect = types.cmp.PreselectMode.Item,
          completion = {
            autocomplete = {
              types.cmp.TriggerEvent.TextChanged,
            },
            completeopt = "menu,menuone,noselect",
            keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
            keyword_length = 1,
          },
          matching = {
            disallow_fuzzy_matching = false,
            disallow_fullfuzzy_matching = false,
            disallow_partial_fuzzy_matching = true,
            disallow_partial_matching = false,
            disallow_prefix_unmatching = false,
            disallow_symbol_nonprefix_matching = true,
          },
        })
      end,
    },

    -- Highlight todo, notes, etc in comments
    {
      "folke/todo-comments.nvim",
      event = "VimEnter",
      dependencies = { "nvim-lua/plenary.nvim" },
      opts = { signs = false },
    },

    {
      "echasnovski/mini.ai",
      version = "*",
      config = function()
        local ai = require("mini.ai")

        ai.setup({
          n_lines = 500,
          custom_textobjects = {
            -- Code block
            o = ai.gen_spec.treesitter({
              a = { "@block.outer", "@conditional.outer", "@loop.outer" },
              i = { "@block.inner", "@conditional.inner", "@loop.inner" },
            }),
            -- Function
            f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
            -- Class
            c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),
            -- Tags
            t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" },
            -- Digits
            d = { "%f[%d]%d+" },
            -- Word with case
            e = {
              { "%u[%l%d]+%f[^%l%d]", "%f[%S][%l%d]+%f[^%l%d]", "%f[%P][%l%d]+%f[^%l%d]", "^[%l%d]+%f[^%l%d]" },
              "^().*()$",
            },
            g = function()
              local start_line, end_line = 1, vim.fn.line("$")
              local to_col = math.max(vim.fn.getline(end_line):len(), 1)

              return { from = { line = start_line, col = 1 }, to = { line = end_line, col = to_col } }
            end,
            -- Usage
            u = ai.gen_spec.function_call(),
            -- Without dot in function name
            U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }),
          },
        })
      end,
    },

    { "echasnovski/mini.jump", version = "*", opts = {} },
    { "echasnovski/mini.splitjoin", version = "*", opts = {} },
    { "echasnovski/mini.pairs", version = "*", opts = {} },

    -- buffer     = 'b'
    -- comment    = 'c'
    -- conflict   = 'x'
    -- diagnostic = 'd'
    -- file       = 'f'
    -- indent     = 'i'
    -- jump       = 'j'
    -- location   = 'l'
    -- oldfile    = 'o'
    -- quickfix   = 'q'
    -- treesitter = 't'
    -- undo       = 'u'
    -- window     = 'w'
    -- yank       = 'y'
    { "echasnovski/mini.bracketed", version = "*", opts = {} },

    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      main = "nvim-treesitter.configs", -- Sets main module to use for opts
      opts = {
        auto_install = true,
        ensure_installed = {
          "ruby",
          "bash",
          "diff",
          "lua",
          "regex",
          "sql",
          "vim",
          "vimdoc",
        },
        highlight = {
          enable = true,
          disable = { "qf" },
          additional_vim_regex_highlighting = { "ruby" },
        },
        indent = {
          enable = true,
          disable = { "ruby" },
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
        textobjects = {
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              ["]f"] = "@function.outer",
              ["]c"] = "@class.outer",
              ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
              ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
            },
            goto_next_end = {
              ["]F"] = "@function.outer",
              ["]C"] = "@class.outer",
            },
            goto_previous_start = {
              ["[f"] = "@function.outer",
              ["[c"] = "@class.outer",
            },
            goto_previous_end = {
              ["[F"] = "@function.outer",
              ["[C"] = "@class.outer",
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ["]a"] = "@parameter.inner",
            },
            swap_previous = {
              ["[a"] = "@parameter.inner",
            },
          },
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
              ["ab"] = "@block.outer",
              ["ib"] = "@block.inner",
            },
            include_surrounding_whitespace = true,
          },
        },
      },
    },

    {
      "vim-ruby/vim-ruby",
      config = function()
        vim.cmd([[autocmd FileType ruby setlocal indentkeys-=.]])
      end,
    },

    {
      "RRethy/nvim-treesitter-endwise",
      event = "InsertEnter",
      config = function()
        require("nvim-treesitter.configs").setup({
          endwise = {
            enable = true,
          },
        })
      end,
    },

    {
      "folke/persistence.nvim",
      event = "BufReadPre",
      opts = {
        dir = vim.fn.stdpath("state") .. "/sessions/",
        need = 1,
        branch = true,
      },
    },

    -- Tmux
    { "tmux-plugins/vim-tmux" },
    {
      "christoomey/vim-tmux-navigator",
      cmd = {
        "TmuxNavigateLeft",
        "TmuxNavigateDown",
        "TmuxNavigateUp",
        "TmuxNavigateRight",
        "TmuxNavigatePrevious",
        "TmuxNavigatorProcessList",
      },
      keys = {
        { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
        { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
        { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
        { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
        { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
      },
    },

    {
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("colorizer").setup({
          "lua",
          "sh",
        })
      end,
    },

    -- Docker
    {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        if type(opts.ensure_installed) == "table" then
          vim.list_extend(opts.ensure_installed, { "dockerfile" })
        end
      end,
    },

    {
      "mason.nvim",
      opts = function(_, opts)
        opts.ensure_installed = opts.ensure_installed or {}
        vim.list_extend(opts.ensure_installed, { "hadolint" })
      end,
    },

    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          dockerls = {},
          docker_compose_language_service = {},
        },
      },
    },

    {
      "lukas-reineke/indent-blankline.nvim",
      main = "ibl",
      opts = {
        scope = { enabled = false },
      },
    },

    {
      "fei6409/log-highlight.nvim",
      config = function()
        require("log-highlight").setup()
      end,
    },

    {
      "nvim-lualine/lualine.nvim",
      dependencies = {
        { "nvim-tree/nvim-web-devicons", opts = {} },
      },
      config = function()
        local highlight = require("lualine.highlight")
        local colors = require("config.colors").colors
        local fname = require("lualine.components.filename"):extend()
        local modules = require("lualine_require").lazy_require({ utils = "lualine.utils.utils" })
        local icons = require("nvim-web-devicons").get_icons()

        local config = {
          saved = { bg = colors.grey12, fg = colors.grey9 },
          modified = { bg = colors.orange_washed, fg = colors.grey10 },
          readonly = { bg = colors.red, fg = colors.fg },
        }

        local default_options = {
          symbols = {
            saved = " [✓]",
            modified = " [~]",
            readonly = " [✘]",
            unnamed = "[No Name]",
            newfile = "[New]",
          },
        }

        local contains = function(list, x)
          for _, v in pairs(list) do
            if v == x then
              return true
            end
          end

          return false
        end

        function fname:init(options)
          fname.super.init(self, options)

          self.highlights = {
            saved = highlight.create_component_highlight_group(config.saved, "filename_status_saved", self.options),
            modified = highlight.create_component_highlight_group(
              config.modified,
              "filename_status_modified",
              self.options
            ),
            readonly = highlight.create_component_highlight_group(
              config.readonly,
              "filename_status_readonly",
              self.options
            ),
          }

          self.options = vim.tbl_deep_extend("force", self.options or {}, default_options)

          if self.options.color == nil then
            self.options.color = ""
          end
        end

        function fname:update_status()
          local data
          local symbols = {}

          if contains(require("config.excluded_filetypes"), vim.bo.filetype) then
            return
          end

          -- Relative path
          data = vim.fn.expand("%:t")
          data = modules.utils.stl_escape(data)

          if data == "" then
            data = self.options.symbols.unnamed
          end

          local state
          if vim.bo.modified then
            state = self.options.symbols.modified
          elseif vim.bo.modifiable == false or vim.bo.readonly == true then
            state = self.options.symbols.readonly
          else
            state = self.options.symbols.saved
          end
          table.insert(symbols, state)

          -- data = data .. "" .. (#symbols > 0 and "" .. table.concat(symbols, "") or "")
          local icon = icons[vim.fn.expand("%:e")]
          if icon then
            icon = icon.icon
          else
            icon = ""
          end

          data = icon .. " " .. data .. "" .. (#symbols > 0 and "" .. table.concat(symbols, "") or "")

          local hi_color
          if vim.bo.modified then
            hi_color = self.highlights.modified
          elseif vim.bo.readonly then
            hi_color = self.highlights.readonly
          else
            hi_color = self.highlights.saved
          end

          data = highlight.component_format_highlight(hi_color) .. data

          return data
        end

        require("lualine").setup({
          options = {
            icons_enabled = true,
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            -- disabled_filetypes = require("config.excluded_filetypes"),
            disabled_filetypes = { "alpha", "Ranger" },
            globalstatus = true,
            always_divide_middle = true,
          },
          sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch" },
            lualine_c = {
              {
                "macro",
                fmt = function()
                  local reg = vim.fn.reg_recording()

                  if reg ~= "" then
                    return "@" .. reg
                  end
                end,
                color = { fg = colors.yellow },
                draw_empty = false,
              },
            },
            lualine_x = { fname },
            lualine_y = { "diff" },
            lualine_z = {},
          },
          inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {},
          },
          winbar = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {},
          },
          extensions = {
            "nvim-tree",
            "man",
            "lazy",
            "trouble",
            "toggleterm",
          },
        })
      end,
    },

    {
      "mhartington/formatter.nvim",
      config = function()
        local util = require("formatter.util")

        require("formatter").setup({
          logging = true,
          log_level = vim.log.levels.WARN,

          filetype = {
            lua = {
              require("formatter.filetypes.lua").stylua,
            },
            ruby = {
              require("formatter.filetypes.ruby").rubocop,
            },
            ["*"] = {
              require("formatter.filetypes.any").remove_trailing_whitespace,
            },
          },
        })

        vim.api.nvim_create_autocmd("BufWritePost", {
          desc = "Auto format on save",
          group = vim.api.nvim_create_augroup("_local_auto_format", { clear = true }),
          pattern = "*",
          command = ":FormatWrite",
        })
      end,
    },

    {
      "rmehri01/onenord.nvim",
      lazy = false,
      config = function()
        local colors = require("config.colors").colors

        require("onenord").setup({
          borders = true,
          fade_nc = false,
          styles = {
            comments = "italic",
            strings = "NONE",
            keywords = "NONE",
            functions = "NONE",
            variables = "NONE",
            diagnostics = "italic",
          },
          disable = {
            cursorline = false,
            eob_lines = true,
          },
          custom_highlights = {
            -- Examples
            -- LspDiagnosticsUnderlineInformation = { style = config.styles.diagnostics, sp = colors.info },
            -- ["@text.uri"] = { fg = colors.cyan, style = "underline" },
            -- Todo = { fg = colors.yellow, bg = colors.none, style = "bold,italic" },
            -- DiagnosticError = { link = "LspDiagnosticsDefaultError" },

            NormalFloat = { fg = colors.magenta, bg = colors.bg_light },

            -- Blink
            -- BlinkCmpMenuBorder = { fg = colors.magenta },
            -- BlinkCmpMenu = { bg = colors.bg_light },

            -- Fidget
            FidgetTask = { link = "Comment" },

            -- Snack Dashboard
            SnacksDashboardTitle = { fg = colors.cyan },
            SnacksDashboardHeader = { link = "Comment" },
            SnacksDashboardFooter = { link = "Comment" },
            SnacksDashboardDesc = { link = "Comment" },
            SnacksDashboardIcon = { link = "Comment" },
            SnacksDashboardFile = { link = "Comment" },
            SnacksDashboardSpecial = { link = "Comment" },
            SnacksDashboardKey = { link = "Comment" },

            -- Snack Picker
            SnacksPickerDir = { link = "Comment" },

            SnacksPickerBoxTitle = { bg = colors.bg, fg = colors.fg_dark },
            SnacksPickerBoxBorder = { fg = colors.bg, bg = colors.bg },

            SnacksPickerList = { bg = colors.bg },
            SnacksPickerListTitle = { bg = colors.bg, fg = colors.fg_dark },
            SnacksPickerListBorder = { bg = colors.bg, fg = colors.bg },

            SnacksPickerInput = { bg = colors.bg },
            SnacksPickerInputTitle = { bg = colors.bg, fg = colors.fg_dark },
            SnacksPickerInputBorder = { bg = colors.bg, fg = colors.bg },

            SnacksPickerPreview = { bg = colors.bg },
            SnacksPickerPreviewTitle = { bg = colors.bg, fg = colors.fg_dark },
            SnacksPickerPreviewBorder = { bg = colors.bg, fg = colors.bg },

            -- Snack index line scope
            SnacksIndentScope = { fg = colors.grey11 },

            -- QuickFix
            QuickFixLineNr = { fg = colors.grey10 },
            QuickFixHeaderHard = { fg = colors.grey10 },
            QuickFixHeaderSoft = { fg = colors.grey10 },
            Delimiter = { fg = colors.grey10 },

            -- Nvim Core
            Folded = { fg = colors.grey10 },

            -- LSP Document Highlights
            LspReferenceText = { bg = colors.grey11, style = "none" },
            LspReferenceRead = { link = "LspReferenceText", style = "none" },
            LspReferenceWrite = { link = "LspReferenceText", style = "none" },

            -- Better Quick List
            BqfPreviewFloat = { bg = colors.bg },
            BqfPreviewBorder = { bg = colors.bg, fg = colors.magenta },
            BqfPreviewTitle = { bg = colors.bg, fg = colors.magenta },

            -- Whichkey
            WhichKeyFloat = { bg = colors.grey14 },
            WhichKey = { fg = colors.yellow },
            WhichKeyGroup = { fg = colors.grey7 },
            WhichKeySeparator = { link = "Comment" },
            WhichKeyDesc = { fg = colors.grey7 },
            WhichKeyValue = { fg = colors.grey7 },
            WhichKeyBorder = { fg = colors.magenta, bg = colors.bg },

            -- Color columns
            VirtColumn = { bg = colors.bg, fg = colors.grey14 },
            VirtColumnNonText = { fg = colors.grey13 },

            --
            IblIndent = { fg = colors.grey13 },

            -- Git Signs
            GitSignsAdd = { fg = colors.green },
            GitSignsChange = { fg = colors.yellow },
            GitSignsDelete = { fg = colors.red },

            -- Git Conflict
            GitConflictCurrent = { bg = colors.green, fg = colors.fg },
            GitConflictCurrentLabel = { bg = colors.green, fg = colors.fg },
            GitConflictIncoming = { bg = colors.red, fg = colors.bg },
            GitConflictIncomingLabel = { bg = colors.red, fg = colors.bg },

            -- Lualine
            StatusLine = { bg = colors.bg },
            StatusLineNC = { bg = colors.bg },
            StatusLineTerm = { bg = colors.bg },
          },
        })
      end,
    },

    {
      "kevinhwang91/nvim-bqf",
      ft = "qf",
      config = function()
        require("bqf").setup({
          auto_enable = true,
          magic_window = true,
          auto_resize_height = true, -- highly recommended enable
          preview = {
            auto_preview = true,
            show_title = false,
            show_scroll_bar = false,
            delay_syntax = 30,
            winblend = 0,
            win_height = 20,
            win_vheight = 20,
            wrap = false,
            buf_label = true,
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
            should_preview_cb = function(bufnr)
              local ret = true
              local bufname = vim.api.nvim_buf_get_name(bufnr)
              local fsize = vim.fn.getfsize(bufname)

              -- skip file size greater than 100k
              if fsize > 100 * 1024 then
                ret = false

              -- skip fugitive buffer
              elseif bufname:match("^fugitive://") then
                ret = false
              end

              return ret
            end,
          },
          -- make `drop` and `tab drop` to become preferred
          func_map = {
            drop = "o",
            openc = "O",
            split = "<C-s>",
            tabdrop = "<C-t>",
            -- set to empty string to disable
            tabc = "",
            ptogglemode = "z,",
          },
          filter = {
            fzf = {
              action_for = { ["ctrl-s"] = "split", ["ctrl-t"] = "tab drop" },
              extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
            },
          },
        })
      end,
    },

    {
      "folke/noice.nvim",
      event = "VeryLazy",
      opts = {
        cmdline = {
          enabled = true, -- enables the Noice cmdline UI
          view = "cmdline",
        },
        popupmenu = {
          enabled = false,
        },
        lsp = {
          progress = {
            enabled = false,
          },
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        routes = {
          {
            filter = {
              event = "msg_show",
              any = {
                { find = "%d+L, %d+B" },
                { find = "; after #%d+" },
                { find = "; before #%d+" },
              },
            },
            view = "mini",
          },
        },
        presets = {
          bottom_search = true,
          command_palette = true,
          long_message_to_split = true,
        },
      },
      -- stylua: ignore
      keys = {
        { "<leader>sn", "", desc = "+noice"},
        { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
        { "<leader>snl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
        { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
        { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
        { "<leader>snd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
        { "<leader>snt", function() require("noice").cmd("pick") end, desc = "Noice Picker (Telescope/FzfLua)" },
        { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll Forward", mode = {"i", "n", "s"} },
        { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll Backward", mode = {"i", "n", "s"}},
      },
      config = function(_, opts)
        if vim.o.filetype == "lazy" then
          vim.cmd([[messages clear]])
        end
        require("noice").setup(opts)
      end,
    },

    {
      "petertriho/nvim-scrollbar",
      event = "BufReadPre",
      config = function()
        require("scrollbar").setup()
      end,
    },

    {
      "kylechui/nvim-surround",
      version = "*", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
      config = function()
        require("nvim-surround").setup({
          keymaps = {
            insert = "<C-g>s",
            insert_line = "<C-g>S",
            normal = "ys",
            normal_cur = "yss",
            normal_line = "yS",
            normal_cur_line = "ySS",
            visual = "S",
            visual_line = "gS",
            delete = "ds",
            change = "cs",
            change_line = "cS",
          },
        })
      end,
    },

    {
      "gbprod/substitute.nvim",
      config = function()
        local substitute = require("substitute")

        substitute.setup({
          on_substitute = nil,
          yank_substituted_text = false,
          preserve_cursor_position = false,
          modifiers = nil,
          highlight_substituted_text = {
            enabled = true,
            timer = 500,
          },
          range = {
            prefix = "s",
            prompt_current_text = false,
            confirm = false,
            complete_word = false,
            subject = nil,
            range = nil,
            suffix = "",
            auto_apply = false,
            cursor_position = "end",
          },
          exchange = {
            motion = false,
            use_esc_to_cancel = true,
            preserve_cursor_position = false,
          },
        })

        vim.keymap.set("n", "s", substitute.operator, { noremap = true, desc = "[S]ubstitute" })
        vim.keymap.set("n", "ss", substitute.line, { noremap = true, desc = "[S]ubstitute Line" })
        -- vim.keymap.set("n", "S", substitute.eol, { noremap = true, desc = "[S]ubstitute EOL" })
        vim.keymap.set("x", "s", substitute.visual, { noremap = true, desc = "[S]ubstitute" })
      end,
    },

    { "lukas-reineke/virt-column.nvim", opts = {} },

    { "folke/ts-comments.nvim", opts = {}, event = "VeryLazy", enabled = vim.fn.has("nvim-0.10.0") == 1 },

    {
      "folke/trouble.nvim",
      cmd = { "Trouble" },
      opts = {
        modes = {
          lsp = {
            win = { position = "right" },
          },
          symbols = { -- Configure symbols mode
            win = {
              type = "split", -- split window
              relative = "win", -- relative to current window
              position = "right", -- right side
              size = 0.3, -- 30% of the window
            },
          },
        },
      },
      keys = {
        { "<leader>xd", "<cmd>Trouble diagnostics toggle<cr>", desc = "[D]iagnostics" },
        { "<leader>xD", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer [D]iagnostics" },
        { "<leader>xs", "<cmd>Trouble symbols toggle<cr>", desc = "[S]ymbols" },
        { "<leader>xt", "<cmd>Trouble lsp toggle<cr>", desc = "[T]oggle References" },
        { "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "[L]ocation List" },
        { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "[Q]uickfix List" },
        {
          "[q",
          function()
            if require("trouble").is_open() then
              require("trouble").prev({ skip_groups = true, jump = true })
            else
              local ok, err = pcall(vim.cmd.cprev)
              if not ok then
                vim.notify(err, vim.log.levels.ERROR)
              end
            end
          end,
          desc = "Previous Trouble/Quickfix Item",
        },
        {
          "]q",
          function()
            if require("trouble").is_open() then
              require("trouble").next({ skip_groups = true, jump = true })
            else
              local ok, err = pcall(vim.cmd.cnext)
              if not ok then
                vim.notify(err, vim.log.levels.ERROR)
              end
            end
          end,
          desc = "Next Trouble/Quickfix Item",
        },
      },
    },

    {
      "folke/todo-comments.nvim",
      cmd = { "TodoTrouble", "TodoTelescope" },
      event = { "BufReadPost", "BufWritePost", "BufNewFile" },
      opts = {},
      -- stylua: ignore
      keys = {
        { "]t", function() require("todo-comments").jump_next() end, desc = "Todo: Next Comment" },
        { "[t", function() require("todo-comments").jump_prev() end, desc = "Todo: Previous Comment" },
        { "<leader>xt", "<cmd>Trouble todo toggle<cr>", desc = "[T]odo" },
        { "<leader>xT", "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>", desc = "[T]odo/Fix/Fixme" },
      },
    },

    {
      "stevearc/quicker.nvim",
      event = "FileType qf",
      opts = {},
      config = function()
        require("quicker").setup({
          borders = {
            vert = " ┃ ",
            strong_header = "━",
            strong_cross = "╋",
            strong_end = "┫",
            soft_header = "╌",
            soft_cross = "╂",
            soft_end = "┨",
          },
        })
      end,
    },
  }, -- End specs
}, {})