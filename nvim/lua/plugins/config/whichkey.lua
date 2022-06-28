local M = {}

function M.setup()
  local module_name = "which-key"
  local whichkey = require(module_name)

  local conf = {
    ignore_missing = true,
    window = {
      border = "single", -- none, single, double, shadow
      position = "bottom", -- bottom, top
      margin = { 0, 0, 0, 0 },
      padding = { 0, 1, 0, 1 },
      winblend = 0
    },
    layout = {
      height = { min = 4, max = 25 }, -- min and max height of the columns
      width = { min = 1, max = 50 }, -- min and max width of the columns
      spacing = 10, -- spacing between columns
      align = "center", -- align columns left, center or right
    },
  }

  local opts = {
    mode = "n",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = false,
  }

  local mappings = {
    ["a"] = { "<cmd>Alpha<cr>", "Startup Screen" },
    ["-"] = { ":split<CR>", "Horizonal Split"  },
    ['\\'] = { ":vsplit<CR>", "Vertical Split"  },

    b = {
      name = "Buffer",
      c = { "<Cmd>close<Cr>", "Close split" },
      w = { "<Cmd>bd!<Cr>", "Close current" },
      D = { "<Cmd>%bd|e#|bd#<Cr>", "Delete all" },
      i = { "mpggVG=<esc>`p", "Indent" },
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
      name = "Scratch Pad",
      c = { "<cmd>ScratchPad<cr>", "Toggle" },
    },

    f = {
      name = "Find",
      a = { "<cmd>Telescope autocommands<cr>", "Autocommands" },
      b = { "<cmd>Telescope buffers<cr>", "Buffers" },
      c = { "<cmd>Telescope commands<cr>", "Commands" },
      d = { "<cmd>Telescope find_dotfiles<cr>", "Dotfiles" },
      e = { "<cmd>RnvimrToggle<CR>", "Ranger" },
      f = { "<cmd>lua require('telescope').extensions.file_browser.file_browser()<cr>", "File Browser" },
      g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
      h = { "<cmd>Telescope help_tags<cr>", "Help" },
      i = { "<cmd>Telescope hightlights<cr>", "Highlights" },
      k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
      m = { "<cmd>Telescope marks<cr>", "Marks" },
      o = { "<cmd>Telescope oldfiles<cr>", "Old Files" },
      p = { "<cmd>Telescope find_files hidden=true layout_config={'prompt_position':'top'}<cr>", "Files" },
      r = { "<cmd>Telescope registers<cr>", "Registers" },
      t = { "<cmd>NvimTreeToggle<cr>", "Tree Explorer" },
      w = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", "Current Buffer" },
    },

    g = {
      name = "Git",
      b = { "<cmd>Gitsigns toggle_current_line_blame<CR>", "Blame" },
      d = { "<cmd>DiffviewOpen<cr>", "Diff View Open" },
      D = { "<cmd>DiffviewClose<cr>", "Diff View Close" },
    },

    l = {
      name = "LSP",
      a = { "<cmd>AerialToggle!<CR>", "Aerial Symbols" }
    },

    n = {
      name = "Neotest",
      a = { "<cmd>lua require('neotest').run.attach()<cr>", "Attach" },
      f = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Run All" },
      l = { "<cmd>lua require('neotest').run.run_last()<cr>", "Run Last" },
      n = { "<cmd>lua require('neotest').run.run()<cr>", "Run Nearest" },
      o = { "<cmd>lua require('neotest').output.open({ enter = true })<cr>", "Output" },
      S = { "<cmd>lua require('neotest').run.stop()<cr>", "Stop" },
      s = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Summary" },
    },

    p = {
      name = "Plugins",
      i = { "<cmd>PackerInstall<cr>", "Install" },
      p = { "<cmd>PackerProfile<cr>", "Profile" },
      s = { "<cmd>PackerSync<cr>", "Sync" },
      S = { "<cmd>PackerStatus<cr>", "Status" },
      u = { "<cmd>PackerUpdate<cr>", "Update" },
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
      p = { "<cmd>let @+ = expand('%:p')<cr> <cmd>lua vim.notifier.info('Yanked filepath')<cr>", "Filepath" },
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
    },
  }

  whichkey.setup(conf)
  whichkey.register(mappings, opts)
end

return M
